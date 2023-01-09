//
//  UIColor_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: UIColor Methods

extension Color {
  
  // MARK: - from RGB
  /// Creates an instance of UIColor, non-optional, using either 256 color scheme or Floating Points.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `UIColor` with a default alpha / opacity of 1.0
  ///
  func convertToUIColorUsing(red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0) -> UIColor {
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
  }
  
  
  // MARK: - from Hex
  /// Creates an Optional Instance of UIColor from a provided Hex Code.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Optional<UIColor>` with a default alpha / opacity of 1.0
  ///
  func convertToUIColorUsing(hex: String?) -> UIColor? {
    guard let rgbColor = convertToRGBUsing(hex: hex) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
  }
  
  
  // MARK: - from HSL
  /// Creates an Optional Instance of UIColor from a provided HSL Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<UIColor>` with a default alpha / opacity of 1.0
  ///
  func convertToUIColorUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) -> UIColor? {
    guard let colorOut = convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return nil }
    guard let redOut = colorOut.red, let greenOut = colorOut.green, let blueOut = colorOut.blue else { return nil }
    return UIColor(red: redOut / 255.0, green: greenOut / 255.0, blue: blueOut / 255.0, alpha: 1.0)
  }
  
  
  // MARK: - from HSV
  // TODO: - To Be Completed
  /// Creates an Optional Instance of UIColor from a provided HSV Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<UIColor>` with a default alpha / opacity of 1.0
  ///
  func convertToUIColorUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) -> UIColor? {
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
  }
  
  
  // MARK: - from CYMK
  /// Creates an Optional Instance of UIColor from a provided CMYK Code.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<UIColor>` with a default alpha / opacity of 1.0
  ///
  func convertToUIColorUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat) -> UIColor? {
    guard let rgb = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return nil }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return nil }
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
  }
}

