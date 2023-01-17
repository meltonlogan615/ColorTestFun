//
//  RGBDefined.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

class RGBView: UIView {
  
  var labelStack = UIStackView()
  
  var redLabelStack = UIStackView()
  var redLabel = UILabel()
  var redTextField = UITextField()
  
  var greenLabelStack = UIStackView()
  var greenLabel = UILabel()
  var greenTextField = UITextField()
  
  var blueLabelStack = UIStackView()
  var blueLabel = UILabel()
  var blueTextField = UITextField()
  
  let sliderStack = UIStackView()
  
  var hexValue = ""
  var redValue: CGFloat = 0
  var blueValue: CGFloat = 0
  var greenValue: CGFloat = 0
  
  var redSlider = UISlider()
  var greenSlider = UISlider()
  var blueSlider = UISlider()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .systemBackground
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension RGBView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    labelStack.translatesAutoresizingMaskIntoConstraints = false
    labelStack.axis = .vertical
    labelStack.spacing = 4
    
    redLabelStack.translatesAutoresizingMaskIntoConstraints = false
    redLabelStack.axis = .horizontal
    redLabelStack.distribution = .equalSpacing
    
    redLabel.translatesAutoresizingMaskIntoConstraints = false
    redLabel.font = .preferredFont(forTextStyle: .title2)
    redLabel.text = "Red:"
    
    redTextField.translatesAutoresizingMaskIntoConstraints = false
    redTextField.text = "\(String(format: "%.0f", redValue))"
    redTextField.textAlignment = .center
    redTextField.borderStyle = .roundedRect
    redTextField.font = .preferredFont(forTextStyle: .title2)
    redTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    redTextField.accessibilityLabel = TextFields.redTextField.rawValue
    redTextField.keyboardType = .numberPad
    
    greenLabelStack.translatesAutoresizingMaskIntoConstraints = false
    greenLabelStack.axis = .horizontal
    greenLabelStack.distribution = .equalSpacing
    
    greenLabel.translatesAutoresizingMaskIntoConstraints = false
    greenLabel.font = .preferredFont(forTextStyle: .title2)
    greenLabel.text = "Green:"
    
    greenTextField.translatesAutoresizingMaskIntoConstraints = false
    greenTextField.text = "\(String(format: "%.0f", greenValue))"
    greenTextField.textAlignment = .center
    greenTextField.borderStyle = .roundedRect
    greenTextField.font = .preferredFont(forTextStyle: .title2)
    greenTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    greenTextField.accessibilityLabel = TextFields.greenTextField.rawValue
    greenTextField.keyboardType = .numberPad
    
    blueLabelStack.translatesAutoresizingMaskIntoConstraints = false
    blueLabelStack.axis = .horizontal
    blueLabelStack.distribution = .equalSpacing
    
    blueLabel.translatesAutoresizingMaskIntoConstraints = false
    blueLabel.font = .preferredFont(forTextStyle: .title2)
    blueLabel.text = "Blue:"
    
    blueTextField.translatesAutoresizingMaskIntoConstraints = false
    blueTextField.text = "\(String(format: "%.0f", blueValue))"
    blueTextField.textAlignment = .center
    blueTextField.borderStyle = .roundedRect
    blueTextField.font = .preferredFont(forTextStyle: .title2)
    blueTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    blueTextField.accessibilityLabel = TextFields.blueTextField.rawValue
    blueTextField.keyboardType = .numberPad
    
    redSlider.translatesAutoresizingMaskIntoConstraints = false
    redSlider.accessibilityLabel = Sliders.redSlider.rawValue
    redSlider.minimumValue = 0
    redSlider.maximumValue = 255
    redSlider.setValue(0, animated: true)
    redSlider.tintColor = .red
    
    greenSlider.translatesAutoresizingMaskIntoConstraints = false
    greenSlider.accessibilityLabel = Sliders.greenSlider.rawValue
    greenSlider.minimumValue = 0
    greenSlider.maximumValue = 255
    greenSlider.setValue(0, animated: true)
    greenSlider.tintColor = .green
    
    blueSlider.translatesAutoresizingMaskIntoConstraints = false
    blueSlider.accessibilityLabel = Sliders.blueSlider.rawValue
    blueSlider.minimumValue = 0
    blueSlider.maximumValue = 255
    blueSlider.setValue(0, animated: true)
    blueSlider.tintColor = .blue
    
    sliderStack.translatesAutoresizingMaskIntoConstraints = false
    sliderStack.axis = .vertical
    sliderStack.spacing = 24
  }
  
  func layout() {
    redLabelStack.addArrangedSubview(redLabel)
    redLabelStack.addArrangedSubview(redTextField)
    labelStack.addArrangedSubview(redLabelStack)
    
    greenLabelStack.addArrangedSubview(greenLabel)
    greenLabelStack.addArrangedSubview(greenTextField)
    labelStack.addArrangedSubview(greenLabelStack)
    
    blueLabelStack.addArrangedSubview(blueLabel)
    blueLabelStack.addArrangedSubview(blueTextField)
    labelStack.addArrangedSubview(blueLabelStack)
    
    addSubview(labelStack)
    NSLayoutConstraint.activate([
      labelStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      labelStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      labelStack.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])

    sliderStack.addArrangedSubview(redSlider)
    sliderStack.addArrangedSubview(greenSlider)
    sliderStack.addArrangedSubview(blueSlider)
    addSubview(sliderStack)
    NSLayoutConstraint.activate([
      sliderStack.topAnchor.constraint(equalToSystemSpacingBelow: labelStack.bottomAnchor, multiplier: 2),
      sliderStack.leadingAnchor.constraint(equalTo: labelStack.leadingAnchor),
      sliderStack.trailingAnchor.constraint(equalTo: labelStack.trailingAnchor),
    ])
    
//    for i in 0 ..< 3 {
//      let slider = UISlider()
//      slider.translatesAutoresizingMaskIntoConstraints = false
//      slider.tag = i
//      switch i {
//        case 0:
//          slider.accessibilityLabel = "redSlider"
//        case 1:
//          slider.accessibilityLabel = "greenSlider"
//        case 2:
//          slider.accessibilityLabel = "blueSlider"
//        default:
//          break
//      }
//      slider.minimumValue = 0
//      slider.maximumValue = 255
//      slider.isContinuous = true
//      slider.setValue(0, animated: true)
//      sliderStack.addArrangedSubview(slider)
//    }
  }
}
