//
//  ColorDetailsViewModel.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//


import UIKit

class ColorDetailsViewModel {
  var color: Color!
  var colorName = String()
  var detailsView: ColorDetailsView!
  
  func unwrapAndAssign() {
    guard let color = color else { return }
    guard let name = color.name else { return }
    guard let hexString = color.hex else { return }
    
    colorName = name
    
    detailsView.colorView.backgroundColor = UIColor(red: (color.red! / 255), green: (color.green! / 255), blue: (color.blue! / 255), alpha: 1.0)
    detailsView.hexLabel.text = "HEX:\n\t#\(hexString)"
    
    guard let red = color.red,
          let green = color.green,
          let blue = color.blue
    else { return }
    
    let redString = String(format: "%.0f", red)
    let greenString = String(format: "%.0f", green)
    let blueString = String(format: "%.0f", blue)
    detailsView.rgbLabel.text = "RGB (256):\n\tRed: \(redString), Green: \(greenString), Blue: \(blueString)"
    
    let redFloat = String(format: "%.3f", (red / 255))
    let greenFloat = String(format: "%.3f", (green / 255))
    let blueFloat = String(format: "%.3f", (blue / 255))
    detailsView.floatLabel.text = "RGB (Floating Point):\n\tRed: \(redFloat), Green: \(greenFloat), Blue: \(blueFloat)"
    
    if let compHex = color.complementary {
      let compColor = Color(hex: compHex)
      let compView = ColorComboView(name: "Complementary", colors: [self.color, compColor])
      detailsView.infoStack.addArrangedSubview(compView)
    }
    
    if let monoHex = color.monochromatic {
      let monoColor = Color(hex: monoHex)
      let monoView = ColorComboView(name: "Monochromatic", colors: [self.color, monoColor])
      detailsView.infoStack.addArrangedSubview(monoView)
    }
    
    if let analArray = color.analogous {
      var finalArray = [Color?]()
      if !analArray.isEmpty {
        let analColors = [color.hex] + analArray
        for color in analColors {
          let anal = Color(hex: color)
          finalArray.append(anal)
        }
        let analView = ColorComboView(name: "Analogous", colors: finalArray)
        detailsView.infoStack.addArrangedSubview(analView)
      }
    }
    
    if let triArray = color.triadic {
      var finalArray = [Color?]()
      if !triArray.isEmpty {
        let triColors = [color.hex] + triArray
        for color in triColors {
          let tri = Color(hex: color)
          finalArray.append(tri)
        }
        let triView = ColorComboView(name: "Triadic", colors: finalArray)
        detailsView.infoStack.addArrangedSubview(triView)
      }
    }
    
    if let tetArray = color.tetradic {
      var finalArray = [Color?]()
      if !tetArray.isEmpty {
        let tetColors = [color.hex] + tetArray
        for color in tetColors {
          let tet = Color(hex: color)
          finalArray.append(tet)
        }
        let tetView = ColorComboView(name: "Tetradic", colors: finalArray)
        detailsView.infoStack.addArrangedSubview(tetView)
      }
    }
  }
}

