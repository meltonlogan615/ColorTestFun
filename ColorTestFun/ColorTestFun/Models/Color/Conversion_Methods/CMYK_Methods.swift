//
//  CMYK_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import Foundation

import UIKit

// MARK: - CYMK Methods

extension Color {
  
  // MARK: - from RGB
  /// Creates an Optional CYMK ("Cyan, Magenta, Yellow, 'K'/Black") Instance of Color from a provided RGB Code.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `Optional<Color>`.  `CYMK` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToCMYKUsing(red: CGFloat?, green: CGFloat?, blue: CGFloat?) -> Color? {
    
    guard red != nil, let red = red,
          green != nil, let green = green,
          blue != nil, let blue = blue else {
      return nil
    }
    
    let redV = red / 255.0, greenV = green / 255.0, blueV = blue / 255.0
    
    var key = 1 - max(redV, greenV, blueV)
    if key.isNaN { key = 0 }
    
    var cyan = (1 - redV - key) / (1 - key)
    if cyan.isNaN { cyan = 0 }
    
    var magenta = (1 - greenV - key) / (1 - key)
    if magenta.isNaN { magenta = 0 }
    
    var yellow = (1 - blueV - key) / (1 - key)
    if yellow.isNaN { yellow = 0 }
    
    return Color(cyan: cyan, magenta: magenta, yellow: yellow, key: key)
  }
  
  
  // MARK: - from Hex
  /// Creates an Optional CYMK ("Cyan, Magenta, Yellow, 'K'/Black") Instance of Color from a provided Hex Code.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Optional<Color>`.  `CYMK` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToCMYKUsing(hex: String?) -> Color? {
    guard let rgbColor = convertToRGBUsing(hex: hex) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToCMYKUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from UIColor
  /// Creates an Optional CYMK ("Cyan, Magenta, Yellow, 'K'/Black") Instance of Color from a provided UIColor.
  ///
  /// - Parameter uiColor:  Any of the default provided `UIColor` or custom instance of `UIColor`.
  ///
  /// - Returns: `Optional<Color>`.  `CYMK` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToCMYKUsing(uiColor: UIColor?) -> Color? {
    guard let rgbColor = convertToRGBUsing(uiColor: uiColor) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToCMYKUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from HSL
  // TODO: - To Be Completed
  /// Creates an Optional CYMK ("Cyan, Magenta, Yellow, 'K'/Black") Instance of Color from a provided HSL Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`.  `CYMK` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToCMYKUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToCMYKUsing(red: red, green: green, blue: blue)

  }
  
  
  // MARK: - from HSV
  // TODO: - To Be Completed
  /// Creates an Optional CYMK ("Cyan, Magenta, Yellow, 'Key'/Black") Instance of Color from a provided HSV Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`.  `CYMK` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToCMYKUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToCMYKUsing(red: red, green: green, blue: blue)
  }
}
