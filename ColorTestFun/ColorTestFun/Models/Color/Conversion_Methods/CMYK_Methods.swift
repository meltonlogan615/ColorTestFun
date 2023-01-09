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
  func convertToCMYKUsing(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color? {
    let pointRed = red/255.0, pointGreen = green/255.0, pointBlue = blue/255.0
    
    let key = 1 - max(pointRed, pointGreen, pointBlue)
    let cyan = (1 - pointRed - key) / (1 - key)
    let magenta = (1 - pointGreen - key) / (1 - key)
    let yellow = (1 - pointBlue - key) / (1 - key)
    
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
    guard let compColor = uiColor?.cgColor.components else { return nil }
    return convertToCMYKUsing(red: compColor[0], green: compColor[1], blue: compColor[2])
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
    return convertToHSLUsing(red: red, green: green, blue: blue)
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
