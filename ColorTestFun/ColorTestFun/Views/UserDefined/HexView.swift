//
//  HexDefined.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

class HexView: UIView {
  
  let colorView = UIView()
  var color: UIColor?
  let hexStack = UIStackView()
  let hexTextField = UITextField()
  let setColorButton = UIButton(type: .system)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HexView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    colorView.translatesAutoresizingMaskIntoConstraints = false
    colorView.layer.borderColor = UIColor.label.cgColor
    colorView.layer.borderWidth = 4
    colorView.layer.cornerRadius = 8
    colorView.clipsToBounds = true
    colorView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    colorView.backgroundColor = color
    
    hexStack.translatesAutoresizingMaskIntoConstraints = false
    hexStack.alignment = .center
    hexStack.axis = .vertical
    hexStack.spacing = 32
    
    hexTextField.translatesAutoresizingMaskIntoConstraints = false
    hexTextField.placeholder = "#000000"
    hexTextField.font = .preferredFont(forTextStyle: .title2)
    hexTextField.textAlignment = .center
    
    setColorButton.translatesAutoresizingMaskIntoConstraints = false
    setColorButton.setTitle("Set Color", for: [])
  }
  
  func layout() {
    addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
      colorView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 4),
      trailingAnchor.constraint(equalToSystemSpacingAfter: colorView.trailingAnchor, multiplier: 4),
    ])
    
    hexStack.addArrangedSubview(hexTextField)
    hexStack.addArrangedSubview(setColorButton)
    addSubview(hexStack)
    NSLayoutConstraint.activate([
      hexStack.topAnchor.constraint(equalToSystemSpacingBelow: colorView.bottomAnchor, multiplier: 4),
      hexStack.leadingAnchor.constraint(equalTo: colorView.leadingAnchor),
      hexStack.trailingAnchor.constraint(equalTo: colorView.trailingAnchor),
    ])
  }
}

