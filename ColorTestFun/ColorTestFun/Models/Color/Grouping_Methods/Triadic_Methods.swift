//
//  Triadic_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - Triadic Methods

extension Color {
  
  // MARK: - from RGB
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  ///  Each `Color` is defined using the same properties as were passed in as variable.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0) -> [Color] {
    var redOut = red
    if red < 0 {
      redOut = red / 255.0
    }
    
    var greenOut = green
    if green < 0 {
      greenOut = green / 255.0
    }
    
    var blueOut = blue
    if blue < 0 {
      blueOut = blue / 255.0
    }
    
    let triadTwo = Color(red: blueOut,
                         green: redOut,
                         blue: greenOut)
    
    let triadThree = Color(red: greenOut,
                           green: blueOut,
                           blue: redOut)
    
    return [triadTwo, triadThree]
  }
  
  
  // MARK: - from Hex
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(hex: String) -> [Color]? {
    guard let rgbIn = convertToRGBUsing(hex: hex) else { return nil }
    
    guard let redIn = rgbIn.red,
          let greenIn = rgbIn.green,
          let blueIn = rgbIn.blue else { return nil }
    
    let triadTwo = Color(red: blueIn,
                         green: redIn,
                         blue: greenIn)
    
    let triadThree = Color(red: greenIn,
                           green: blueIn,
                           blue: redIn)
    
    return [triadTwo, triadThree]
  }
  
  
  // MARK: - from UIColor
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(uiColor: UIColor?) { }
  
  
  // MARK: - from HSL
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) { }
  
  
  // MARK: - from HSV
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) { }
  
  
  // MARK: - from CYMK
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key black: CGFloat) { }
}

