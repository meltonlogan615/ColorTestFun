//
//  CMYKView.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/12/23.
//

import UIKit

class CMYKView: UIView {

  var labelStack = UIStackView()
  
  var cyanLabelStack = UIStackView()
  var cyanLabel = UILabel()
  var cyanTextField = UITextField()
  
  var magentaLabelStack = UIStackView()
  var magentaLabel = UILabel()
  var magentaTextField = UITextField()
  
  var yellowLabelStack = UIStackView()
  var yellowLabel = UILabel()
  var yellowTextField = UITextField()
  
  var keyLabelStack = UIStackView()
  var keyLabel = UILabel()
  var keyTextField = UITextField()
  
  var cyanSlider = UISlider()
  var magentaSlider = UISlider()
  var yellowSlider = UISlider()
  var keySlider = UISlider()
  
  let sliderStack = UIStackView()
  
  var hexValue = ""
  var cyanValue: CGFloat = 0
  var magentaValue: CGFloat = 0
  var yellowValue: CGFloat = 0
  var keyValue: CGFloat = 0

  
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

extension CMYKView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    labelStack.translatesAutoresizingMaskIntoConstraints = false
    labelStack.axis = .vertical
    labelStack.spacing = 4
    
    cyanLabelStack.translatesAutoresizingMaskIntoConstraints = false
    cyanLabelStack.axis = .horizontal
    cyanLabelStack.distribution = .equalSpacing
    
    cyanLabel.translatesAutoresizingMaskIntoConstraints = false
    cyanLabel.font = .preferredFont(forTextStyle: .title2)
    cyanLabel.text = "Cyan:"
    
    cyanTextField.translatesAutoresizingMaskIntoConstraints = false
    cyanTextField.text = "\(String(format: "%.2f", cyanValue))"
    cyanTextField.textAlignment = .center
    cyanTextField.borderStyle = .roundedRect
    cyanTextField.font = .preferredFont(forTextStyle: .title2)
    cyanTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    cyanTextField.accessibilityLabel = TextFields.cyanTextField.rawValue
    cyanTextField.keyboardType = .decimalPad
    
    magentaLabelStack.translatesAutoresizingMaskIntoConstraints = false
    magentaLabelStack.axis = .horizontal
    magentaLabelStack.distribution = .equalSpacing
    
    magentaLabel.translatesAutoresizingMaskIntoConstraints = false
    magentaLabel.font = .preferredFont(forTextStyle: .title2)
    magentaLabel.text = "Magenta:"
    
    magentaTextField.translatesAutoresizingMaskIntoConstraints = false
    magentaTextField.text = "\(String(format: "%.2f", magentaValue))"
    magentaTextField.textAlignment = .center
    magentaTextField.borderStyle = .roundedRect
    magentaTextField.font = .preferredFont(forTextStyle: .title2)
    magentaTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    magentaTextField.accessibilityLabel = TextFields.magentaTextField.rawValue
    magentaTextField.keyboardType = .decimalPad
    
    yellowLabelStack.translatesAutoresizingMaskIntoConstraints = false
    yellowLabelStack.axis = .horizontal
    yellowLabelStack.distribution = .equalSpacing
    
    yellowLabel.translatesAutoresizingMaskIntoConstraints = false
    yellowLabel.font = .preferredFont(forTextStyle: .title2)
    yellowLabel.text = "Yellow:"
    
    yellowTextField.translatesAutoresizingMaskIntoConstraints = false
    yellowTextField.text = "\(String(format: "%.2f", yellowValue))"
    yellowTextField.textAlignment = .center
    yellowTextField.borderStyle = .roundedRect
    yellowTextField.font = .preferredFont(forTextStyle: .title2)
    yellowTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    yellowTextField.accessibilityLabel = TextFields.yellowTextField.rawValue
    yellowTextField.keyboardType = .decimalPad
    
    keyLabelStack.translatesAutoresizingMaskIntoConstraints = false
    keyLabelStack.axis = .horizontal
    keyLabelStack.distribution = .equalSpacing
    
    keyLabel.translatesAutoresizingMaskIntoConstraints = false
    keyLabel.font = .preferredFont(forTextStyle: .title2)
    keyLabel.text = "Key:"
    
    keyTextField.translatesAutoresizingMaskIntoConstraints = false
    keyTextField.text = "\(String(format: "%.2f", keyValue))"
    keyTextField.textAlignment = .center
    keyTextField.borderStyle = .roundedRect
    keyTextField.font = .preferredFont(forTextStyle: .title2)
    keyTextField.widthAnchor.constraint(equalToConstant: 96).isActive = true
    keyTextField.accessibilityLabel = TextFields.keyTextField.rawValue
    keyTextField.keyboardType = .decimalPad
    
    cyanSlider.translatesAutoresizingMaskIntoConstraints = false
    cyanSlider.accessibilityLabel = Sliders.cyanSlider.rawValue
    cyanSlider.minimumValue = 0.0
    cyanSlider.maximumValue = 1.0
    cyanSlider.value = Float(cyanValue)
    cyanSlider.tintColor = .cyan
    
    magentaSlider.translatesAutoresizingMaskIntoConstraints = false
    magentaSlider.accessibilityLabel = Sliders.magentaSlider.rawValue
    magentaSlider.minimumValue = 0.0
    magentaSlider.maximumValue = 1.0
    magentaSlider.value = Float(magentaValue)
    magentaSlider.tintColor = .magenta

    
    yellowSlider.translatesAutoresizingMaskIntoConstraints = false
    yellowSlider.accessibilityLabel = Sliders.yellowSlider.rawValue
    yellowSlider.minimumValue = 0.0
    yellowSlider.maximumValue = 1.0
    yellowSlider.value = Float(yellowValue)
    yellowSlider.tintColor = .yellow

    
    keySlider.translatesAutoresizingMaskIntoConstraints = false
    keySlider.accessibilityLabel = Sliders.keySlider.rawValue
    keySlider.minimumValue = 0.0
    keySlider.maximumValue = 1.0
    keySlider.value = Float(keyValue)
    keySlider.tintColor = .black

    
    sliderStack.translatesAutoresizingMaskIntoConstraints = false
    sliderStack.axis = .vertical
    sliderStack.spacing = 24
  }
  
  func layout() {
    cyanLabelStack.addArrangedSubview(cyanLabel)
    cyanLabelStack.addArrangedSubview(cyanTextField)
    labelStack.addArrangedSubview(cyanLabelStack)
    
    magentaLabelStack.addArrangedSubview(magentaLabel)
    magentaLabelStack.addArrangedSubview(magentaTextField)
    labelStack.addArrangedSubview(magentaLabelStack)

    yellowLabelStack.addArrangedSubview(yellowLabel)
    yellowLabelStack.addArrangedSubview(yellowTextField)
    labelStack.addArrangedSubview(yellowLabelStack)

    keyLabelStack.addArrangedSubview(keyLabel)
    keyLabelStack.addArrangedSubview(keyTextField)
    labelStack.addArrangedSubview(keyLabelStack)
    
    addSubview(labelStack)
    NSLayoutConstraint.activate([
      labelStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      labelStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      labelStack.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    sliderStack.addArrangedSubview(cyanSlider)
    sliderStack.addArrangedSubview(magentaSlider)
    sliderStack.addArrangedSubview(yellowSlider)
    sliderStack.addArrangedSubview(keySlider)
    addSubview(sliderStack)
    NSLayoutConstraint.activate([
      sliderStack.topAnchor.constraint(equalToSystemSpacingBelow: labelStack.bottomAnchor, multiplier: 2),
      sliderStack.leadingAnchor.constraint(equalTo: labelStack.leadingAnchor),
      sliderStack.trailingAnchor.constraint(equalTo: labelStack.trailingAnchor),
    ])
    
//    for i in 0 ..< 4 {
//      let slider = UISlider()
//      slider.translatesAutoresizingMaskIntoConstraints = false
//      slider.tag = i
//      slider.minimumValue = 0
//      slider.maximumValue = 1
//      slider.isContinuous = true
//      slider.setValue(0, animated: true)
//      sliderStack.addArrangedSubview(slider)
//    }
  }
}
