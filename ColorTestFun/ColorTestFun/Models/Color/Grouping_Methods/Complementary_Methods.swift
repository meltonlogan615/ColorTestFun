//
//  Complementary_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - Complementary Methods

extension Color {
  
  // MARK: - from RGB
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter red: `CGFloat` in either 256 (0 - 255) or Floating Point format (0.0 - 1.0).
  /// - Parameter green: `CGFloat` in either 256 (0 - 255) or Floating Point format (0.0 - 1.0).
  /// - Parameter blue: `CGFloat` in either 256 (0 - 255) or Floating Point format (0.0 - 1.0).
  ///
  /// - Returns: `Color?` Initialized with Red, Green, & Blue values.
  ///
  func getComplementaryColorsUsing(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color? {
    var redOut = red
    if redOut > 0 {
      redOut = red * 255
    }
    var greenOut = green
    if greenOut > 0 {
      greenOut = green * 255
    }
    var blueOut = blue
    if blueOut > 0 {
      blueOut = blue * 255
    }
    
    let compColor = Color(red: CGFloat(255 - redOut),
                          green: CGFloat(255 - greenOut),
                          blue: CGFloat(255 - blueOut))
    return compColor
  }
  
  
  // MARK: - from Hex
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Color?` Initialized with a Hex value.
  ///
  func getComplementaryColorsUsing(hex: String?) -> Color? {
    guard hex != nil, let hex = hex else { return nil }
    guard let color = self.convertToRGBUsing(hex: hex) else { return nil }
    guard let red = color.red, let green = color.green, let blue = color.blue else { return nil }
    guard let hexComp = getComplementaryColorsUsing(red: red, green: green, blue: blue) else { return nil }
    return convertToHexUsing(red: hexComp.red, green: hexComp.green, blue: hexComp.blue)
  }
  
  
  // MARK: - from UIColor
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns: `UIColor?`
  ///
  func getComplementaryColorsUsing(uiColor: UIColor?) -> UIColor? {
    guard uiColor != nil, let color = uiColor else { return nil }
    guard let components = color.cgColor.components else { return nil }
    let red = components[0] * 255, green = components[1] * 255, blue = components[2] * 255
    guard let uiComp = getComplementaryColorsUsing(red: red, green: green, blue: blue) else { return nil }
    return convertToUIColorUsing(red: uiComp.red, green: uiComp.green, blue: uiComp.blue)
  }
  
  
  // MARK: - from HSL
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Color?` Initialized with Hue, Saturation, & Luminance values.
  ///
  func getComplementaryColorsUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) -> Color? {
    guard let color = self.convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return nil }
    guard let red = color.red, let green = color.green, let blue = color.blue else { return nil }
    guard let hslComp = getComplementaryColorsUsing(red: red, green: green, blue: blue) else { return nil }
    return convertToHSLUsing(red: hslComp.red, green: hslComp.green, blue: hslComp.blue)
  }
  
  
  // MARK: - from HSV
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Color?` Initialized with Hue, Saturation, & Value values.
  ///
  func getComplementaryColorsUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) -> Color? {
    guard let color = self.convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return nil }
    guard let red = color.red, let green = color.green, let blue = color.blue else { return nil }
    guard let hsvComp = getComplementaryColorsUsing(red: red, green: green, blue: blue) else { return nil }
    return convertToHSVUsing(red: hsvComp.red, green: hsvComp.green, blue: hsvComp.blue)
  }
  
  
  // MARK: - from CYMK
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Color?` Initialized with Cyan, Magenta, Yellow, & Key values.
  ///
  func getComplementaryColorsUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat) -> Color? {
    guard let color = self.convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return nil }
    guard let red = color.red, let green = color.green, let blue = color.blue else { return nil }
    guard let cmykComp = getComplementaryColorsUsing(red: red, green: green, blue: blue) else { return nil }
    return convertToCMYKUsing(red: cmykComp.red, green: cmykComp.green, blue: cmykComp.blue)
  }
}

