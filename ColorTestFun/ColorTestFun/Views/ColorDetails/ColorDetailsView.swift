//
//  ColorDetailsView.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//

import UIKit

class ColorDetailsView: UIView {
  
  let scrollView = UIScrollView()
  let contentView = UIView()
  let infoStack = UIStackView()
  
  //  var color: NamedColor!
  var colorView = UIView()
  var hexLabel = UILabel()
  var rgbLabel = UILabel()
  var floatLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    style()
    layout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

extension ColorDetailsView {
  
  func style() {
    translatesAutoresizingMaskIntoConstraints = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    
    colorView.translatesAutoresizingMaskIntoConstraints = false
    colorView.layer.borderColor = UIColor.label.cgColor
    colorView.layer.borderWidth = 2
    colorView.layer.cornerRadius = 8
    colorView.clipsToBounds = true
    colorView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    
    infoStack.translatesAutoresizingMaskIntoConstraints = false
    infoStack.axis = .vertical
    infoStack.spacing = 16
    
    hexLabel.translatesAutoresizingMaskIntoConstraints = false
    hexLabel.font = .preferredFont(forTextStyle: .body)
    hexLabel.numberOfLines = 0
    
    rgbLabel.translatesAutoresizingMaskIntoConstraints = false
    rgbLabel.font = .preferredFont(forTextStyle: .body)
    rgbLabel.numberOfLines = 0
    
    floatLabel.translatesAutoresizingMaskIntoConstraints = false
    floatLabel.font = .preferredFont(forTextStyle: .body)
    floatLabel.numberOfLines = 0
  }
  
  func layout() {
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])
    
    infoStack.addArrangedSubview(colorView)
    infoStack.addArrangedSubview(hexLabel)
    infoStack.addArrangedSubview(rgbLabel)
    infoStack.addArrangedSubview(floatLabel)
    
    contentView.addSubview(infoStack)
    NSLayoutConstraint.activate([
      infoStack.topAnchor.constraint(equalTo: contentView.topAnchor),
      infoStack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 4),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: infoStack.trailingAnchor, multiplier: 4),
      infoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}

