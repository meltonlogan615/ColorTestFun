//
//  RGBViewModel.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/11/23.
//


import UIKit

class RGBViewModel {
  let convert = Color()
  var sliderView: RGBView!
  var hexView: HexView!
  var segControl: UISegmentedControl!
  var definedColor: UIColor?
  var redValue: CGFloat = 0.01
  var blueValue: CGFloat = 0.01
  var greenValue: CGFloat = 0.01

  func activateInputs() {
    for slider in sliderView.sliderStack.arrangedSubviews {
      guard let colorSlider = slider as? UISlider else { return }
      switch slider.tag {
        case 0:
          slider.tintColor = .red
          sliderView.redValue = CGFloat(colorSlider.value)
        case 1:
          slider.tintColor = .green
          sliderView.greenValue = CGFloat(colorSlider.value)
        case 2:
          slider.tintColor = .blue
          sliderView.blueValue = CGFloat(colorSlider.value)
        default:
          break
      }
      colorSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .allEvents)
    }
    segControl.addTarget(self, action: #selector(changeView), for: .valueChanged)
    hexView.setColorButton.addTarget(self, action: #selector(setViewColor), for: .touchUpInside)
  }

  @objc
  func sliderValueChanged(_ sender: UISlider) {
    switch sender.tag {
      case 0:
        self.redValue = CGFloat(sender.value)
        sliderView.redValue = self.redValue
      case 1:
        self.greenValue = CGFloat(sender.value)
        sliderView.greenValue = self.greenValue
      case 2:
        self.blueValue = CGFloat(sender.value)
        sliderView.blueValue = self.blueValue
      default:
        break
    }

    let color = UIColor(red: CGFloat(redValue / 255), green: CGFloat(greenValue / 255), blue: CGFloat(blueValue / 255), alpha: 1.0)
    sliderView.rgbLabel.text = "Red: \(String(format: "%.0f", redValue)), Green: \(String(format: "%.0f", greenValue)), Blue \(String(format: "%.0f", blueValue))"
    sliderView.color = color
    sliderView.colorView.backgroundColor = color
  }


  @objc
  func getRelatedColors() {

  }

  @objc
  func changeView() {
    switch segControl.selectedSegmentIndex {
      case 0:
        sliderView.isHidden = false
        hexView.isHidden = true
        print("fart")
      case 1:
        sliderView.isHidden = true
        hexView.isHidden = false
        print("fuck")
      case 2:
        sliderView.isHidden = true
        hexView.isHidden = true
        print("shit piss cunt")
      default:
        break
    }
  }

  @objc
  func setViewColor() {
    guard hexView.hexTextField.text != nil,
          let hexText = hexView.hexTextField.text else { return }

    let color = convert.convertToRGBUsing(hex: hexText)

    guard let safeColor = color else { return }

    guard let red = safeColor.red else { return }
    print(red)
            guard let green = safeColor.green else { return }
    print(green)
    guard let blue = safeColor.blue else { return }
    print(blue)

    let newBGColor = UIColor(red: CGFloat(red / 255),
                             green: CGFloat(green / 255),
                             blue: CGFloat(blue / 255),
                             alpha: 1.0)
    hexView.color = newBGColor
    hexView.colorView.backgroundColor = newBGColor
    print(newBGColor)
  }

}

