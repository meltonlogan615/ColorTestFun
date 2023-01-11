//
//  Color.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

class Color: Codable, Equatable {
  var name: String?
  
  var red: CGFloat?
  var green: CGFloat?
  var blue: CGFloat?
  var alpha: CGFloat?
  
  var hex: String?
  
  var uiColor: UIColor? {
    guard let red = red, let green = green, let blue = blue, let alpha = alpha else { return nil }
    return UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: alpha)
  }

  var hue: CGFloat?
  var saturation: CGFloat?
  var luminance: CGFloat?
  var value: CGFloat?
  
  var cyan: CGFloat?
  var magenta: CGFloat?
  var yellow: CGFloat?
  var key: CGFloat?
  
  
  /// `Complementary Colors` are two colors that are directly opposite of each other on the color wheel.
  ///
  var complementary: String?
  /// `Monochromatic Colors` are two colors that are
  ///
  var monochromatic: String?
  
  /// `Analogous Colors` are three colors that are directly opposite of each other on the color wheel.
  ///
  var analogous: [String]?
  
  /// `Triadic Colors` are three colors that are evenly spaced around the color wheel at 120 degrees in either direction.
  ///
  var triadic: [String]?
  
  /// `Tetratic Colors` are four colors that are evenly spaced at 90 degree increments around the color wheel.
  var tetradic: [String]?
  
  // MARK: - Required Full Init
  init(red: CGFloat? = nil,
       green: CGFloat? = nil,
       blue: CGFloat? = nil,
       hex: String? = nil,
//       uiColor: UIColor? = nil,
       hue: CGFloat? = nil,
       saturation: CGFloat? = nil,
       luminance: CGFloat? = nil,
       value: CGFloat? = nil,
       key: CGFloat? = nil,
       cyan: CGFloat? = nil,
       magenta: CGFloat? = nil,
       yellow: CGFloat? = nil,
       monochromatic: String? = nil,
       complementary: String? = nil,
       triadic: [String]? = nil,
       tetradic: [String]? = nil) {
    self.red = red
    self.green = green
    self.blue = blue
    self.hex = hex
//    self.uiColor = uiColor
    self.hue = hue
    self.saturation = saturation
    self.luminance = luminance
    self.value = value
    self.cyan = cyan
    self.magenta = magenta
    self.yellow = yellow
    self.key = key
    self.monochromatic = monochromatic
    self.complementary = complementary
    self.triadic = triadic
    self.tetradic = tetradic
  }
  
  // MARK: - RGB Init
  convenience init(red: CGFloat?, green: CGFloat?, blue: CGFloat?) {
    self.init()
    self.red = red
    self.green = green
    self.blue = blue

  }
  
  // MARK: - Hex Init
  convenience init(hex: String?) {
    self.init()
    self.hex = hex
  }
  
  // MARK: UIColor Init
//  convenience init(uiColor: UIColor?) {
//    self.init()
//    self.uiColor = uiColor
//  }
  
  // MARK: - HSL Init
  convenience init(hue: CGFloat?, saturation: CGFloat?, luminance: CGFloat?) {
    self.init()
    self.hue = hue
    self.saturation = saturation
    self.luminance = luminance
  }
  
  // MARK: - HSV Init
  convenience init(hue: CGFloat?, saturation: CGFloat?, value: CGFloat?) {
    self.init()
    self.hue = hue
    self.saturation = saturation
    self.value = value
  }
  
  // MARK: - CYMK Init
  convenience init(cyan: CGFloat?, magenta: CGFloat?, yellow: CGFloat?, key: CGFloat?) {
    self.init()
    self.cyan = cyan
    self.magenta = magenta
    self.yellow = yellow
    self.key = key
  }
  
  
  // MARK: - Equatible
  static func < (lhs: Color, rhs: Color) -> Bool {
    var returnedBool = false
    if let leftSide = lhs.name {
      if let rightSide = rhs.name {
        returnedBool = leftSide < rightSide
      }
    }
    return returnedBool
  }
  
  static func == (lhs: Color, rhs: Color) -> Bool {
    var returnBool = false
    if let leftRed = lhs.red {
      if let rightRed = rhs.red {
        returnBool = leftRed == rightRed
      }
    }
    return returnBool
  }
}
