//
//  RGB_Methods.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

// MARK: - RGB Methods
extension Color {
  
  // MARK: - from Hex
  /// Creates an Optional RGB Instance of Color from a provided Hex Code.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `Optional<Color>`.  `RGB` values are in 256 format (0 - 255).
  ///
  func convertToRGBUsing(hex: String?) -> Color? {
    guard hex != nil, let hex = hex else { return nil }
    
    let decoder = ["0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15]
    
    var hexArray = hex.uppercased().split(separator: "")
    
    if hexArray.contains("#") {
      guard let hashIndex = hexArray.firstIndex(of: "#") else { return nil }
      hexArray.remove(at: hashIndex)
    }
    
    if hexArray.count > 6 {
      print("too many")
      return nil
    }
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    switch hexArray.count {
      case 3:
        print(3)
        
      case 6:
        for i in 0 ..< hexArray.count {
          guard let value = decoder[String(hexArray[i])] else { return nil }
          switch i {
            case 0:
              red += CGFloat(value * 16)
            case 1:
              red += CGFloat(value)
            case 2:
              green += CGFloat(value * 16)
            case 3:
              green += CGFloat(value)
            case 4:
              blue += CGFloat(value * 16)
            case 5:
              blue += CGFloat(value)
            default:
              break
          }
        }
      default:
        return nil
    }
    return Color(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from UIColor
  /// Creates an Optional RGB Instance of Color from a provided UIColor
  ///
  /// - Parameter uiColor:  Any of the default provided `UIColor` or custom instance of `UIColor`.
  ///
  /// - Returns: `Optional<Color>`. `RGB` values are in 256 format (0 - 255).
  ///
  func convertToRGBUsing(uiColor: UIColor?) -> Color? {
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
    return Color(red: red, green: green, blue: blue)
  }
  
  
  // MARK: - from HSL
  ///  Creates an Optional RGB Instance of Color from a provided HSL Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`. `RGB` values are in 256 format (0 - 255).
  ///
  func convertToRGBUsing(hue: CGFloat, saturation: CGFloat, luminance: CGFloat) -> Color? {
    
    let delta = saturation * (1 - abs((2 * luminance) - 1))
    
    let m = 255 * (luminance - (delta / 2))
    
    let degree = abs((hue / 60).truncatingRemainder(dividingBy: 2) - 1)
    
    let x = delta * (1 - degree)
    
    switch hue {
      case 0 ..< 60:
        return Color(red: (255 * delta) + m, green: (255 * x) + m, blue: m)
        
      case 60 ..< 120:
        return Color(red: (255 * x) + m, green: (255 * delta) + m, blue: m)
        
      case 120 ..< 180:
        return Color(red: m, green: (255 * delta) + m, blue: (255 * x) + m)
        
      case 180 ..< 240:
        return Color(red: m, green: (255 * x) + m, blue: (255 * delta) + m)
        
      case 240 ..< 300:
        return Color(red: (255 * x) + m, green: m, blue: (255 * delta) + m)
        
      case 300 ..< 360:
        return Color(red: (255 * delta) + m, green: m, blue: (255 * x) + m)
        
      default:
        break
    }
    return nil
  }
  
  
  // MARK: - from HSV
  ///  Creates an Optional Instance of Color from a provided HSV Code.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`.  `RGB` values are in 256 format (0 - 255).
  ///
  func convertToRGBUsing(hue: CGFloat, saturation: CGFloat, value: CGFloat) -> Color? {
    let M = 255.0 * value
    
    let m = M * (1.0 - saturation)
    
    let degree = (1 - abs((hue / 60).truncatingRemainder(dividingBy: 2) - 1))
    
    let zeta = (M - m) * degree
    
    switch hue {
      case 0 ..< 60:
        return Color(red: M, green: zeta + m, blue: m)
        
      case 60 ..< 120:
        return Color(red: zeta + m, green: M, blue: m)
        
      case 120 ..< 180:
        return Color(red: m, green: M, blue: zeta + m)
        
      case 180 ..< 240:
        return Color(red: m, green: zeta + m, blue: M)
        
      case 240 ..< 300:
        return Color(red: zeta + m, green: m, blue: M)
        
      case 300 ..< 360:
        return Color(red: M, green: m, blue: zeta + m)
        
      default:
        break
    }
    return nil
  }
  
  
  // MARK: - from CYMK
  ///  Creates an Optional RGB Instance of Color from a provided CYMK Code.
  ///
  /// - Parameter cyan: defined as a percentage decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `Optional<Color>`.  `RGB` values are in 256 format (0 - 255).
  ///
  func convertToRGBUsing(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, key: CGFloat) -> Color? {
    let red = 255 * (1 - cyan) * (1 - key)
    let green = 255 * (1 - magenta) * (1 - key)
    let blue = 255 * (1 - yellow) * (1 - key)
    return Color(red: red, green: green, blue: blue)
  }
}

