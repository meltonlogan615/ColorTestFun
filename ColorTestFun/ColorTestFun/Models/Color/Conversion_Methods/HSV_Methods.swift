//
//  HSV_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - HSV Methods

extension Color {
  
  // MARK: - from RGB
  // TODO: - This feels wrong. Review to see what it should belong to.
  /// Creates an Optional HSV ("Hue, Saturation, Value") Instance of Color from a provided RGB Code.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Value` values are in decimal percentages (0.0 - 1.0).
  ///
  func convertToHSVUsing(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color? {
    let maxV = max(red, green, blue)
    let minV = min(red, green, blue)
    let delta = (maxV - minV) / 255
    
    let value = ((maxV + minV) / 510.0)
    
    let saturation = delta / (2.0 - abs(2.0 * value))
    
    let segmentOne = (red - (green * 0.5) - (blue * 0.5))
    let squares = ((red * red) + (green * green) + (blue * blue))
    let multiples = ((red * green) - (red * blue) - (green * blue))
    let rooted = sqrt(squares - multiples)
    let prevalue = (acos(segmentOne / rooted) * 180.0 / .pi)
    var hue = CGFloat()
    
    if green >= blue {
      hue = prevalue
    } else {
      hue = (360 - prevalue)
    }
    return Color(hue: round(hue * 10) / 10, saturation: round(saturation * 10) / 10, value: round(value * 10) / 10)
  }
  
  
  // MARK: - from Hex
  /// Creates an Optional HSV ("Hue, Saturation, Value") Instance of Color from a provided Hex Code.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Value` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSVUsing(hex: String?) -> Color? {
    guard let rgbColor = convertToRGBUsing(hex: hex) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSVUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from UIColor
  /// Creates an Optional HSV ("Hue, Saturation, Value") Instance of Color from a provided UIColor.
  ///
  /// - Parameter uiColor: Any of the default provided `UIColor` or custom instance of `UIColor`.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Value` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSVUsing(uiColor: UIColor?) -> Color? {
    guard let compColor = uiColor?.cgColor.components else { return nil }
    return convertToHSVUsing(red: compColor[0], green: compColor[1], blue: compColor[2])
  }
  
  
  // MARK: - from HSL
  /// Creates an Optional HSV ("Hue, Saturation, Value") Instance of Color from a provided HSL Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Value` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSVUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSVUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from CYMK
  // TODO: - To Be Completed
  /// Creates an Optional HSV ("Hue, Saturation, Value") Instance of Color from a provided CMYK Code.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Value` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSVUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key black: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: black) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSVUsing(red: red, green: green, blue: blue)
  }
}
