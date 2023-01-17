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
  func convertToHSVUsing(red: CGFloat?, green: CGFloat?, blue: CGFloat?) -> Color? {
    guard red != nil, let red = red,
          green != nil, let green = green,
          blue != nil, let blue = blue else {
      return nil
    }
    let redV = (red / 255.0)
    let greenV = (green / 255.0)
    let blueV = (blue / 255.0)
    
    let maxV = max(redV, greenV, blueV)
    let minV = min(redV, greenV, blueV)
    
    let delta = maxV - minV
    
    var hue = CGFloat()
    var value = CGFloat()
    var saturation = CGFloat()
    
    if delta == 0 {
      hue = 0
    } else if maxV == redV {
      hue = 60 * ((greenV - blueV) / delta).truncatingRemainder(dividingBy: 6)
    } else if maxV == greenV {
      hue = 60 * (((blueV - redV) / delta) + 2.0)
    } else if maxV == blueV {
      hue = 60 * (((redV - greenV) / delta) + 4)
    }
    
    if maxV == 0 {
      saturation = 0
    } else {
      saturation = round((delta / maxV) * 10) / 10
    }
    
    value = maxV
    
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
    guard let rgbColor = convertToRGBUsing(uiColor: uiColor) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSVUsing(red: red, green: green, blue: blue)
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
  func convertToHSVUsing(hue: CGFloat?, saturation: CGFloat?, luminance: CGFloat?) -> Color? {
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
  func convertToHSVUsing(cyan: CGFloat?, magenta: CGFloat?, yellow: CGFloat?, key black: CGFloat?) -> Color? {
    guard let rgbColor = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: black) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSVUsing(red: red, green: green, blue: blue)
  }
}

