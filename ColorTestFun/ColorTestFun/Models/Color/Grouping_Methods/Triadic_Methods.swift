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
  /// Returns `[Color]?`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  ///  Each `Color` is defined using the same properties as were passed in as variable.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `[Color?]` Initialized with Red, Green, & Blue values.
  ///
  func getTriadicColorsUsing(red: CGFloat? = 0, green: CGFloat? = 0, blue: CGFloat? = 0) -> [Color?] {
    guard let red = red, let green = green, let blue = blue else { return [nil] }
    
    let triadTwo = Color(red: blue,
                         green: red,
                         blue: green)
    
    let triadThree = Color(red: green,
                           green: blue,
                           blue: red)
    
    return [triadTwo, triadThree]
  }
  
  
  // MARK: - from Hex
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `[Color?]` Initialized with a Hex value.
  ///
  func getTriadicColorsUsing(hex: String?) -> [Color?] {
    guard let rgb = convertToRGBUsing(hex: hex) else { return [nil] }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return [nil] }
    let tri = getTriadicColorsUsing(red: red, green: green, blue: blue)
    let hexTri = tri.map {
      convertToHexUsing(red: $0?.red, green: $0?.green, blue: $0?.blue)
    }
    return hexTri
  }
  
  
  // MARK: - from UIColor
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  ///
  func getTriadicColorsUsing(uiColor: UIColor?) -> [UIColor?] {
    guard let rgb = convertToRGBUsing(uiColor: uiColor) else { return [nil] }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return [nil] }
    let tri = getTriadicColorsUsing(red: red, green: green, blue: blue)
    let uiTri = tri.map {
      convertToUIColorUsing(red: $0?.red, green: $0?.green, blue: $0?.blue)
    }
    return uiTri
  }
  
  
  // MARK: - from HSL
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Hue, Saturation, & Luminance values.
  ///
  func getTriadicColorsUsing(hue: CGFloat?, saturation: CGFloat?, luminance: CGFloat?) -> [Color?] {
    guard let rgb = convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return [nil] }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return [nil] }
    let tri = getTriadicColorsUsing(red: red, green: green, blue: blue)
    let hslTri = tri.map {
      convertToHSLUsing(red: $0?.red, green: $0?.green, blue: $0?.blue)
    }
    return hslTri
  }
  
  
  // MARK: - from HSV
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Hue, Saturation, & Value values.
  ///
  func getTriadicColorsUsing(hue: CGFloat?, saturation: CGFloat?, value: CGFloat?) -> [Color?] {
    guard let rgb = convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return [nil] }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return [nil] }
    let tri = getTriadicColorsUsing(red: red, green: green, blue: blue)
    let hsvTri = tri.map {
      convertToHSVUsing(red: $0?.red, green: $0?.green, blue: $0?.blue)
    }
    return hsvTri
  }
  
  
  // MARK: - from CYMK
  /// Returns `[Color]`, that contains two instances of `Color` that are 120 degrees in either direction on the color wheel from the input value.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Cyan, Magenta, Yellow, & Key values.
  ///
  func getTriadicColorsUsing(cyan: CGFloat?, magenta: CGFloat?, yellow: CGFloat?, key: CGFloat?) -> [Color?] {
    guard let rgb = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return [nil] }
    guard let red = rgb.red, let green = rgb.green, let blue = rgb.blue else { return [nil] }
    let tri = getTriadicColorsUsing(red: red, green: green, blue: blue)
    let cmykTri = tri.map {
      convertToCMYKUsing(red: $0?.red, green: $0?.green, blue: $0?.blue)
    }
    return cmykTri
  }
}

