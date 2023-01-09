//
//  Monochromatic_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - Monochromatic Methods

extension Color {
  
  // MARK: - from RGB
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(red: CGFloat, green: CGFloat, blue: CGFloat) { }
  
  
  // MARK: - from Hex
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(hex: String) { }
  
  
  // MARK: - from UIColor
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(uiColor: UIColor?) { }
  
  
  // MARK: - from HSL
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) { }
  
  // MARK: - from HSV
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) { }
  
  // MARK: - from CYMK
  /// Generates a single value of a similar shade but with a lighter or darker tint.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getMonochromeColorUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key black: CGFloat) { }
}

