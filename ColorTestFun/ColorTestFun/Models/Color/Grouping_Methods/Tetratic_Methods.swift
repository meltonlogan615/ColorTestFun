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
  /// - Returns: `[Color?]` Initialized with Red, Green, & Blue values.
  ///
  func getTetraticColorsUsing(red: CGFloat?, green: CGFloat?, blue: CGFloat?) -> [Color?] {
    guard let hsl = convertToHSLUsing(red: red, green: green, blue: blue) else { return [nil] }
    guard let hslHue = hsl.hue, let hslSat = hsl.saturation, let hslVal = hsl.value else { return [nil] }
    let tet = getTetraticColorsUsing(hue: hslHue, saturation: hslSat, luminance: hslVal)
    let rgbTet = tet.map {
      self.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    return rgbTet
  }
  
  
  // MARK: - from Hex
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hex: A `Hexidecimal String` consisting of a combination of Letters (A - F) and Numbers (0 - 9).
  ///
  /// - Returns: `[Color?]` Initialized with a Hex value.
  ///
  func getTetraticColorsUsing(hex: String?) -> [Color?] {
    guard let hsl = convertToHSLUsing(hex: hex) else { return [nil] }
    guard let hslHue = hsl.hue, let hslSat = hsl.saturation, let hslVal = hsl.value else { return [nil] }
    let tet = getTetraticColorsUsing(hue: hslHue, saturation: hslSat, luminance: hslVal)
    let hexTet = tet.map {
      self.convertToHexUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    return hexTet
  }
  
  
  // MARK: - from UIColor
  /// Returns `[Color]`:  contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter uiColor:
  ///
  /// - Returns:
  ///
  func getTetraticColorsUsing(uiColor: UIColor?) -> [UIColor?] {
    guard let hsl = convertToHSLUsing(uiColor: uiColor) else { return [nil] }
    guard let hslHue = hsl.hue, let hslSat = hsl.saturation, let hslVal = hsl.value else { return [nil] }
    let tet = getTetraticColorsUsing(hue: hslHue, saturation: hslSat, luminance: hslVal)
    let uiTet = tet.map {
      self.convertToUIColorUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    return uiTet
  }
  
  
  // MARK: - from HSL
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter luminance: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Hue, Saturation, & Luminance values.
  ///
  func getTetraticColorsUsing(hue: CGFloat?, saturation: CGFloat?, luminance: CGFloat?) -> [Color?] {
    guard let hue = hue, let saturation = saturation, let luminance = luminance else { return [nil] }
    var hueOne = CGFloat()
    var hueTwo = CGFloat()
    var hueThree = CGFloat()
    if (hue + 90) < 360 {
      hueOne = (hue + 90)
    } else {
      hueOne = ((hue + 90) - 360)
    }
    
    if (hue + 180) < 360 {
      hueTwo = (hue + 180)
    } else {
      hueTwo = ((hue + 180) - 360)
    }
    
    if hue + 270 < 360 {
      hueThree = (hue + 270)
    } else {
      hueThree = ((hue + 270) - 360)
    }
    
    let tetOne = Color(hue: hueOne, saturation: saturation, luminance: luminance)
    let tetTwo = Color(hue: hueTwo, saturation: saturation, luminance: luminance)
    let tetThree = Color(hue: hueThree, saturation: saturation, luminance: luminance)
    return [tetOne, tetTwo, tetThree]
  }
  
  
  // MARK: - from HSV
  /// Returns `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter hue: the number of degrees around the color wheel from 0 - 359.
  /// - Parameter saturation: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter value: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Hue, Saturation, & Value values.
  ///
  func getTetraticColorsUsing(hue: CGFloat?, saturation: CGFloat?, value: CGFloat?) -> [Color?] {
    guard let hsl = convertToHSLUsing(hue: hue, saturation: saturation, value: value) else { return [nil] }
    guard let hslHue = hsl.hue, let hslSat = hsl.saturation, let hslVal = hsl.value else { return [nil] }
    let tet = getTetraticColorsUsing(hue: hslHue, saturation: hslSat, luminance: hslVal)
    let hsvTet = tet.map {
      self.convertToHSVUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    return hsvTet
  }
  
  
  // MARK: - from CYMK
  /// Returns  `[Color]`, that contains three instances of `Color` that are at 90 degree increments around the color wheel, beginning from the input value.
  ///
  /// - Parameter cyan: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter magenta: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter yellow: defined as a percentage in decimal format ranging from 0.0 - 1.0.
  /// - Parameter key (black):  defined as a percentage in decimal format ranging from 0.0 - 1.0.
  ///
  /// - Returns: `[Color?]` Initialized with Cyan, Magenta, Yellow, & Key values.
  ///
  func getTetraticColorsUsing(cyan: CGFloat?, magenta: CGFloat?, yellow: CGFloat?, key: CGFloat?) -> [Color?] {
    guard let hsl = convertToHSLUsing(cyan: cyan, magenta: magenta, yellow: yellow, key: key) else { return [nil] }
    guard let hslHue = hsl.hue, let hslSat = hsl.saturation, let hslVal = hsl.value else { return [nil] }
    let tet = getTetraticColorsUsing(hue: hslHue, saturation: hslSat, luminance: hslVal)
    let cmykTet = tet.map {
      self.convertToCMYKUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    return cmykTet
  }
}

