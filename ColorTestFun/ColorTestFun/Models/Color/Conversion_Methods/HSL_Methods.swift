//
//  HSL_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - HSL Methods

extension Color {
  
  // MARK: - from RGB
  /// Creates an Optional HSL ("Hue, Saturation, Luminance") Instance of Color from a provided RGB Code.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Luminances` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSLUsing(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color? {
    let cMax = max(red, green, blue)
    let cMin = min(red, green, blue)
    
    let redV = red / 255.0
    let greenV = green / 255.0
    let blueV = blue / 255.0
    
    let delta = ((cMax / 255) - (cMin / 255))
    var hue = CGFloat()
    var saturation = CGFloat()
    var luminance = ((cMax / 255) + (cMin / 255)) / 2
    
    if delta == 0 {
      saturation = 0
    } else {
      saturation = delta / (1 - abs((2 * luminance) - 1))
    }
    
    if delta == 0.0 {
      hue = 0.0
    } else if cMax == red {
      hue = 60 * ((greenV - blueV) / delta).truncatingRemainder(dividingBy: 6)
    } else if cMax == green {
      hue = 60 * (((blueV - redV) / delta) + 2)
    } else if cMax == blue {
      hue = 60 * (((redV - greenV) / delta) + 4)
    }
    hue = round(hue)
    print(hue)
    saturation = round(saturation * 10) / 10
    print(saturation)
    luminance = round(luminance * 10) / 10
    print(luminance)
    
    return Color(hue: hue, saturation: saturation, luminance: luminance)
  }
  
  
  // MARK: - from Hex
  /// Creates an OptionalHSL ("Hue, Saturation, Luminance")  Instance of Color from a provided Hex Code.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Luminances` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSLUsing(hex: String?) -> Color? {
    guard let rgbColor = convertToRGBUsing(hex: hex) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSLUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from UIColor
  /// Creates an Optional HSL ("Hue, Saturation, Luminance") Instance of Color from a provided UIColor.
  ///
  /// - Parameter uiColor: Any of the default provided `UIColor` or custom instance of `UIColor`.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Luminances` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSLUsing(uiColor: UIColor?) -> Color? {
    guard let rgbColor = convertToRGBUsing(uiColor: uiColor) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSLUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from HSV
  /// Creates an Optional HSL ("Hue, Saturation, Luminance") Instance of Color from a provided HSV Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Luminances` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSLUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSLUsing(red: red, green: green, blue: blue)

  }
  
  
  // MARK: - from CYMK
  /// Creates an Optional HSL ("Hue, Saturation, Luminance") Instance of Color from a provided CMYK Code.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`. `Hue`, `Saturation`, `Luminances` values are in decimal percentages (0.0 - 1.0)
  ///
  func convertToHSLUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat) -> Color? {
    guard let rgbColor = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return convertToHSLUsing(red: red, green: green, blue: blue)
  }
}

