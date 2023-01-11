//
//  RGBDefined.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import Combine
import UIKit

class RGBView: UIView {
  let colorView = UIView()
  
  var hexLabel = UILabel()
  var rgbLabel = UILabel()
  
  var color: UIColor?
  var redSlider = UISlider()
  var greenSlider = UISlider()
  var blueSlider = UISlider()
  let sliderStack = UIStackView()
  
  var hexValue = ""
  var redValue: CGFloat = 0
  var blueValue: CGFloat = 0
  var greenValue: CGFloat = 0
  
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
    colorView.translatesAutoresizingMaskIntoConstraints = false
    colorView.layer.borderColor = UIColor.label.cgColor
    colorView.layer.borderWidth = 4
    colorView.layer.cornerRadius = 8
    colorView.clipsToBounds = true
    colorView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    
    hexLabel.translatesAutoresizingMaskIntoConstraints = false
    hexLabel.font = .preferredFont(forTextStyle: .title2)
    
    
    rgbLabel.translatesAutoresizingMaskIntoConstraints = false
    rgbLabel.font = .preferredFont(forTextStyle: .title2)
    rgbLabel.text = "RGB: \n\tRed: \(redValue), Green: \(greenValue), Blue \(blueValue)"
    
    sliderStack.translatesAutoresizingMaskIntoConstraints = false
    sliderStack.axis = .vertical
    sliderStack.spacing = 32
    
    for i in 0 ..< 3 {
      let slider = UISlider()
      slider.translatesAutoresizingMaskIntoConstraints = false
      slider.tag = i
      slider.minimumValue = 0
      slider.maximumValue = 255
      slider.isContinuous = true
      slider.setValue(0, animated: true)
      sliderStack.addArrangedSubview(slider)
    }
    
  }
  
  func layout() {
    addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      colorView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
      trailingAnchor.constraint(equalToSystemSpacingAfter: colorView.trailingAnchor, multiplier: 4),
    ])
    
    addSubview(hexLabel)
    NSLayoutConstraint.activate([
      hexLabel.topAnchor.constraint(equalToSystemSpacingBelow: colorView.bottomAnchor, multiplier: 2),
      hexLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor),
      hexLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
    ])
    
    addSubview(rgbLabel)
    NSLayoutConstraint.activate([
      rgbLabel.topAnchor.constraint(equalToSystemSpacingBelow: hexLabel.bottomAnchor, multiplier: 2),
      rgbLabel.leadingAnchor.constraint(equalTo: colorView.leadingAnchor),
      rgbLabel.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
    ])
    
    addSubview(sliderStack)
    NSLayoutConstraint.activate([
      sliderStack.topAnchor.constraint(equalToSystemSpacingBelow: rgbLabel.bottomAnchor, multiplier: 2),
      sliderStack.leadingAnchor.constraint(equalTo: colorView.leadingAnchor),
      sliderStack.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
    ])
  }
}
