//
//  Tetratic_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - Tetratic Methods

extension Color {
  
  // MARK: - from RGB
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(red: CGFloat, green: CGFloat, blue: CGFloat) { }
  
  
  // MARK: - from Hex
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `[Color]`
  ///
  func getTetraticColorsUsing(hex: String) { }
  
  
  // MARK: - from UIColor
  /// Returns `[Color]`:  contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(uiColor: UIColor?) { }
  
  
  // MARK: - from HSL
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) { }
  
  
  // MARK: - from HSV
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) { }
  
  
  // MARK: - from CYMK
  /// Returns  `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key black: CGFloat) { }
}

