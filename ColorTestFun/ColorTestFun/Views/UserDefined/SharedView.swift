//
//  SharedView.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/11/23.
//

import UIKit

class SharedView: UIView {
  
  let colorView = UIView()
  
  let segController = UISegmentedControl(items: [
    DefinedViews.rgb.rawValue.localizedUppercase,
    DefinedViews.hex.rawValue.localizedUppercase,
    DefinedViews.picker.rawValue.localizedUppercase,
    DefinedViews.cmyk.rawValue.localizedUppercase
  ])
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension SharedView {
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    
    colorView.translatesAutoresizingMaskIntoConstraints = false
    colorView.layer.borderColor = UIColor.label.cgColor
    colorView.layer.borderWidth = 2
    colorView.layer.cornerRadius = 8
    colorView.clipsToBounds = true
    colorView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    
    segController.translatesAutoresizingMaskIntoConstraints = false
    segController.selectedSegmentIndex = 0
    segController.backgroundColor = .systemBackground
  }
  
  func layout() {
    addSubview(segController)
    NSLayoutConstraint.activate([
      segController.topAnchor.constraint(equalTo: topAnchor),
      segController.leadingAnchor.constraint(equalTo: leadingAnchor),
      segController.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
    
    addSubview(colorView)
    NSLayoutConstraint.activate([
      colorView.topAnchor.constraint(equalToSystemSpacingBelow: segController.bottomAnchor, multiplier: 2),
      colorView.leadingAnchor.constraint(equalTo: segController.leadingAnchor),
      colorView.trailingAnchor.constraint(equalTo: segController.trailingAnchor),
      colorView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

  }
}
