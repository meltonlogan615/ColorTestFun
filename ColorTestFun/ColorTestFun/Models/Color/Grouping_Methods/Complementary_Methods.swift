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
  /// - Returns:
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
  /// - Returns
  ///
  func getComplementaryColorsUsing(hex: String) { }
  
  
  // MARK: - from UIColor
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  func getComplementaryColorsUsing(uiColor: UIColor?) { }
  
  
  // MARK: - from HSL
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getComplementaryColorsUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) { }
  
  
  // MARK: - from HSV
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getComplementaryColorsUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) { }
  
  
  // MARK: - from CYMK
  /// Generates an single of color diametrically opposite of the input value on the color wheel.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getComplementaryColorsUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key black: CGFloat) { }
}

