//
//  UserDefinedViewModel.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/11/23.
//

import UIKit

class UserDefinedViewModel {
  let convert = Color()
  var sharedView: SharedView!
  var rgbView: RGBView!
  var hexView: HexView!
  var cmykView: CMYKView!
  
  var segControl: UISegmentedControl!
  
  var definedColor: UIColor?
  var redValue: CGFloat = 0.0
  var blueValue: CGFloat = 0.0
  var greenValue: CGFloat = 0.0
  
  var cyanValue: CGFloat = 0.0
  var magentaValue: CGFloat = 0.0
  var yellowValue: CGFloat = 0.0
  var keyValue: CGFloat = 0.0
  
  func activateSharedInputs() {
    segControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
  }
    
  @objc
  func changeView() {
    switch segControl.selectedSegmentIndex {
      case 0:
        rgbView.isHidden = false
        hexView.isHidden = true
        cmykView.isHidden = true
      case 1:
        rgbView.isHidden = true
        hexView.isHidden = false
        cmykView.isHidden = true
      case 2:
        rgbView.isHidden = true
        hexView.isHidden = true
        cmykView.isHidden = true
      case 3:
        rgbView.isHidden = true
        hexView.isHidden = true
        cmykView.isHidden = false
      default:
        break
    }
  }
}


// MARK: - RGB
extension UserDefinedViewModel {
  func activateRGBInputs() {
    rgbView.redSlider.addTarget(self, action: #selector(rgbSliderValueChanged(_:)), for: .valueChanged)
    rgbView.greenSlider.addTarget(self, action: #selector(rgbSliderValueChanged(_:)), for: .valueChanged)
    rgbView.blueSlider.addTarget(self, action: #selector(rgbSliderValueChanged(_:)), for: .valueChanged)
  }
  
  @objc
  func rgbSliderValueChanged(_ sender: UISlider) {
    switch sender.accessibilityLabel {
      case Sliders.redSlider.rawValue:
        self.redValue = CGFloat(sender.value)
        rgbView.redTextField.text = "\(String(format: "%.0f", self.redValue))"
      case Sliders.greenSlider.rawValue:
        self.greenValue = CGFloat(sender.value)
        rgbView.greenTextField.text = "\(String(format: "%.0f", self.greenValue))"
      case Sliders.blueSlider.rawValue:
        self.blueValue = CGFloat(sender.value)
        rgbView.blueTextField.text = "\(String(format: "%.0f", self.blueValue))"
      default:
        break
    }
    
    let color = UIColor(red: CGFloat(redValue / 255),
                        green: CGFloat(greenValue / 255),
                        blue: CGFloat(blueValue / 255),
                        alpha: 1.0)
    
    guard let hexColor = convert.convertToHexUsing(uiColor: color) else { return }
    guard let hexString = hexColor.hex else { return }
    
    hexView.hexTextField.text = "\(hexString)"

    guard let cmykColor = convert.convertToCMYKUsing(red: redValue,
                                                     green: greenValue,
                                                     blue: blueValue)
    else { return }
    
    guard let cyan = cmykColor.cyan,
            let magenta = cmykColor.magenta,
            let yellow = cmykColor.yellow,
            let key = cmykColor.key
    else { return }
    
    cmykView.cyanValue = cyan
    cmykView.cyanTextField.text = "\(String(format: "%.2f", cyan))"
    cmykView.cyanSlider.value = Float(cyan)

    cmykView.magentaValue = magenta
    cmykView.magentaTextField.text = "\(String(format: "%.2f", magenta))"
    cmykView.magentaSlider.value = Float(magenta)

    cmykView.yellowValue = yellow
    cmykView.yellowTextField.text = "\(String(format: "%.2f", yellow))"
    cmykView.yellowSlider.value = Float(yellow)
    
    cmykView.keyValue = key
    cmykView.keyTextField.text = "\(String(format: "%.2f", key))"
    cmykView.keySlider.value = Float(key)
    
//    for slider in cmykView.sliderStack.arrangedSubviews {
//      guard let colorSlider = slider as? UISlider else { return }
//      switch colorSlider.accessibilityLabel {
//
//        case Sliders.cyanSlider.rawValue:
//          colorSlider.value = Float(cyan)
//          cmykView.cyanValue = cyan
//
//        case Sliders.magentaSlider.rawValue:
//          colorSlider.value = Float(magenta)
//          cmykView.magentaValue = magenta
//
//        case Sliders.yellowSlider.rawValue:
//          colorSlider.value = Float(yellow)
//          cmykView.yellowValue = yellow
//
//        case Sliders.keySlider.rawValue:
//          let keyValue = key
//          colorSlider.value = Float(keyValue)
//          cmykView.keyValue = keyValue
//        default:
//          break
//      }
//    }
    
    sharedView.colorView.backgroundColor = color
  }
}

// MARK: - HEX
extension UserDefinedViewModel {
  func activateHexInputs() {
    hexView.setColorButton.addTarget(self, action: #selector(setViewColor), for: .touchUpInside)
  }
  
  // Hex Button
  @objc
  func setViewColor() {
    guard hexView.hexTextField.text != nil,
          let hexText = hexView.hexTextField.text else { return }
    
    let color = convert.convertToRGBUsing(hex: hexText)
    
    guard let safeColor = color else { return }
    
    guard let red = safeColor.red, let green = safeColor.green, let blue = safeColor.blue else { return }
    
    redValue = red
    greenValue = green
    blueValue = blue
    let newBGColor = UIColor(red: CGFloat(red / 255),
                             green: CGFloat(green / 255),
                             blue: CGFloat(blue / 255),
                             alpha: 1.0)

    guard let components = newBGColor.cgColor.components else { return }
    
    for slider in rgbView.sliderStack.arrangedSubviews {
      guard let colorSlider = slider as? UISlider else { return }
      switch slider.tag {
        case 0:
          let redValue = components[0] * 255
          colorSlider.value = Float(redValue)
          rgbView.redValue = redValue
        case 1:
          let greenValue = components[1] * 255
          colorSlider.value = Float(greenValue)
          rgbView.greenValue = greenValue
        case 2:
          let blueValue = components[2] * 255
          colorSlider.value = Float(blueValue)
          rgbView.blueValue = blueValue
        default:
          break
      }
      sharedView.colorView.backgroundColor = newBGColor
    }
  }
}

// MARK: - CMYK
extension UserDefinedViewModel {
  func activateCMYKInputs() {
    cmykView.cyanSlider.addTarget(self, action: #selector(cmykSliderValueChanged(_:)), for: .valueChanged)
    cmykView.magentaSlider.addTarget(self, action: #selector(cmykSliderValueChanged(_:)), for: .valueChanged)
    cmykView.yellowSlider.addTarget(self, action: #selector(cmykSliderValueChanged(_:)), for: .valueChanged)
    cmykView.keySlider.addTarget(self, action: #selector(cmykSliderValueChanged(_:)), for: .valueChanged)
  }
  
  @objc
  func cmykSliderValueChanged(_ sender: UISlider) {
    switch sender.accessibilityLabel {
      case Sliders.cyanSlider.rawValue:
        self.cyanValue = CGFloat(sender.value)
        cmykView.cyanTextField.text = String(format: "%.2f", cyanValue)
        
      case Sliders.magentaSlider.rawValue:
        self.magentaValue = CGFloat(sender.value)
        cmykView.magentaTextField.text = String(format: "%.2f", magentaValue)
        
      case Sliders.yellowSlider.rawValue:
        self.yellowValue = CGFloat(sender.value)
        cmykView.yellowTextField.text = String(format: "%.2f", yellowValue)
        
      case Sliders.keySlider.rawValue:
        self.keyValue = CGFloat(sender.value)
        cmykView.keyTextField.text = String(format: "%.2f", keyValue)
        
      default:
        break
    }
    
    let color = convert.convertToUIColorUsing(cyan: cyanValue, magenta: magentaValue, yellow: yellowValue, key: keyValue)
    sharedView.colorView.backgroundColor = color
    
    guard let hex = convert.convertToHexUsing(cyan: cyanValue, magenta: magentaValue, yellow: yellowValue, key: keyValue) else { return }
    hexView.hexTextField.text = hex.hex
    
    guard let rgb = convert.convertToRGBUsing(cyan: cyanValue, magenta: magentaValue, yellow: yellowValue, key: keyValue) else { return }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return }
    rgbView.redSlider.value = Float(red)
    rgbView.redValue = red
    rgbView.redTextField.text = String(format: "%.0f", red)
    
    rgbView.greenSlider.value = Float(green)
    rgbView.greenValue = green
    rgbView.greenTextField.text = String(format: "%.0f", green)
    
    rgbView.blueSlider.value = Float(blue)
    rgbView.blueValue = blue
    rgbView.blueTextField.text = String(format: "%.0f", blue)
  }
}

