//
//  Hex_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - Hex Methods

extension Color {
  
  // MARK: - from RGB
  /// Creates an Optional Hexidecimal Instance of Color from a provided RGB Code.
  ///
  /// - Parameter red: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter green: `CGFloat` in 256 bit format (0 - 255).
  /// - Parameter blue: `CGFloat` in 256 bit format (0 - 255).
  ///
  /// - Returns: `Optional<Color>` with a `String` value for its `hex` property.
  ///
  func convertToHexUsing(red: CGFloat?, green: CGFloat?, blue: CGFloat?) -> Color? {
    guard let red = red, let green = green, let blue = blue else { return nil }
    let decoder = [0: "0", 1: "1", 2: "2", 3: "3", 4: "4", 5: "5", 6: "6", 7: "7", 8: "8", 9: "9", 10: "A", 11: "B", 12: "C", 13: "D", 14: "E", 15: "F"]
    var hexOut = String()
    let redHexOne = (red / 16)
    let redHexTwo = (red.truncatingRemainder(dividingBy: 16))
    hexOut += decoder[Int(redHexOne)] ?? "0"
    hexOut += decoder[Int(redHexTwo)] ?? "0"
    let greenHexOne = (green / 16)
    let greenHexTwo = (green.truncatingRemainder(dividingBy: 16))
    hexOut += decoder[Int(greenHexOne)] ?? "0"
    hexOut += decoder[Int(greenHexTwo)] ?? "0"
    let blueHexOne = (blue / 16)
    let blueHexTwo = (blue.truncatingRemainder(dividingBy: 16))
    hexOut += decoder[Int(blueHexOne)] ?? "0"
    hexOut += decoder[Int(blueHexTwo)] ?? "0"
    
    return Color(hex: hexOut)
  }
  
  
  // MARK: - from UIColor
  ///  Creates an Optional Hexidecimal Instance of Color from a provided UIColor
  ///
  /// - Parameter uiColor: Any of the default provided `UIColor` or custom instance of `UIColor`.
  ///
  /// - Returns: `Optional<Color>` with a `String` value for its `hex` property.
  ///
  func convertToHexUsing(uiColor: UIColor?) -> Color? {
    guard let color = uiColor?.cgColor.components else { return nil }
    var red = CGFloat()
    var green = CGFloat()
    var blue = CGFloat()
    for i in 0 ..< color.count {
      switch i {
        case 0:
          red = color[i] * 255
        case 1:
          green = color[i] * 255
        case 2:
          blue = color[i] * 255
        default:
          break
      }
    }
    return convertToHexUsing(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from HSL
  /// Creates an Optional Hexidecimal Instance of Color from a provided HSL Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>` with a `String` value for its `hex` property.
  ///
  func convertToHexUsing(hue: CGFloat?, saturation: CGFloat?, luminance: CGFloat?) -> Color? {
//    guard let hue = hue, let saturation = saturation, let luminance = luminance else { return nil }
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, luminance: luminance) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    let hexColor = convertToHexUsing(red: red, green: green, blue: blue)
    return hexColor
  }
  
  
  // MARK: - from HSV
  /// Creates an Optional Hexidecimal Instance of Color from a provided HSV Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>` with a `String` value for its `hex` property.
  ///
  func convertToHexUsing(hue: CGFloat?, saturation: CGFloat?, value: CGFloat?) -> Color? {
//    guard let hue = hue, let saturation = saturation, let value = value else { return nil }
    guard let rgbColor = convertToRGBUsing(hue: hue, saturation: saturation, value: value) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    let hexColor = convertToHexUsing(red: red, green: green, blue: blue)
    return hexColor
  }
  
  
  // MARK: - from CYMK
  /// Creates an Optional Hexidecimal Instance of Color from a provided CYMK Code.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>` with a `String` value for its `hex` property.
  ///
  func convertToHexUsing(cyan: CGFloat?, magenta: CGFloat?, yellow: CGFloat?, key: CGFloat?) -> Color? {
    guard let rgbColor = convertToRGBUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return nil }
    guard let red = rgbColor.red, let green = rgbColor.green, let blue = rgbColor.blue else { return nil }
    let hexColor = convertToHexUsing(red: red, green: green, blue: blue)
    return hexColor
  }
}

