//
//  ColorCombos.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//


import UIKit

class ColorComboView: UIView {
  let color = Color()

  var sectionName: String!
  var sectionLabel = UILabel()

  var colorStack = UIStackView()
  var colors: [Color?]!

  override init(frame: CGRect) {
    super.init(frame: frame)
  }

  convenience init(name: String, colors: [Color?]) {
    self.init()
    self.sectionName = name
    self.colors = colors
    setupView()

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupView() {
    translatesAutoresizingMaskIntoConstraints = false
    sectionLabel.translatesAutoresizingMaskIntoConstraints = false
    sectionLabel.text = sectionName
    sectionLabel.textColor = .label
    sectionLabel.font = .preferredFont(forTextStyle: .title3)
    sectionLabel.textAlignment = .natural
    addSubview(sectionLabel)
    NSLayoutConstraint.activate([
      sectionLabel.topAnchor.constraint(equalTo: topAnchor),
      sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    colorStack.translatesAutoresizingMaskIntoConstraints = false
    colorStack.axis = .horizontal
    colorStack.distribution = .fillEqually
    colorStack.layer.borderColor = UIColor.label.cgColor
    colorStack.layer.borderWidth = 0.5
    colorStack.layer.cornerRadius = 8
    colorStack.clipsToBounds = true

    addSubview(colorStack)
    NSLayoutConstraint.activate([
      colorStack.topAnchor.constraint(equalToSystemSpacingBelow: sectionLabel.bottomAnchor, multiplier: 1),
      colorStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      colorStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      colorStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      colorStack.heightAnchor.constraint(equalToConstant: 80)
    ])

    if colors.isEmpty { print("nothing to see") }
    for color in colors {
      guard let color = color else { return }
      let colorView = UIView()
      colorView.translatesAutoresizingMaskIntoConstraints = false
      var viewBG = UIColor()
      if color.uiColor == nil {
        guard let safeBG = color.convertToUIColorUsing(hex: color.hex) else { return }
        viewBG = safeBG
      } else {
        guard let safeBG = color.uiColor else { return }
        viewBG = safeBG
      }
      
      colorView.backgroundColor = viewBG

      let hexLabel = UILabel()
      hexLabel.translatesAutoresizingMaskIntoConstraints = false
      hexLabel.font = .preferredFont(forTextStyle: .caption1)
      hexLabel.text = color.hex
      colorView.addSubview(hexLabel)
      NSLayoutConstraint.activate([
        hexLabel.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
        colorView.bottomAnchor.constraint(equalToSystemSpacingBelow: hexLabel.bottomAnchor, multiplier: 1)
      ])

      colorStack.addArrangedSubview(colorView)
    }
  }
}

