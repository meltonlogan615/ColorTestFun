//
//  HexDefined.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

class HexView: UIView {
  
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
    
    hexStack.translatesAutoresizingMaskIntoConstraints = false
    hexStack.alignment = .center
    hexStack.axis = .vertical
    hexStack.spacing = 32
    
    hexTextField.translatesAutoresizingMaskIntoConstraints = false
    hexTextField.placeholder = "#000000"
    hexTextField.font = .preferredFont(forTextStyle: .title2)
    hexTextField.autocapitalizationType = .allCharacters
    hexTextField.textAlignment = .center
    hexTextField.borderStyle = .roundedRect
    hexTextField.accessibilityLabel = TextFields.hexTextField.rawValue
    
    setColorButton.translatesAutoresizingMaskIntoConstraints = false
    setColorButton.setTitle("Set Color", for: [])
  }
  
  func layout() {
    hexStack.addArrangedSubview(hexTextField)
    hexStack.addArrangedSubview(setColorButton)
    addSubview(hexStack)
    NSLayoutConstraint.activate([
      hexStack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      hexStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      hexStack.trailingAnchor.constraint(equalTo: trailingAnchor),
    ])
  }
}

