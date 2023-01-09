//
//  TestData.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

struct TestData {
  static let rgbColors: [Color?] = [
    Color(red: 255, green: 0, blue: 0),
    Color(red: 0, green: 255, blue: 0),
    Color(red: 0, green: 0, blue: 255),
    Color(red: 0, green: 0, blue: 0),
    Color(red: 255, green: 255, blue: 255)
  ]
  
  static let hexColors: [Color?] = [
    Color(hex: "FF0000"),
    Color(hex: "00FF00"),
    Color(hex: "0000FF"),
    Color(hex: "000000"),
    Color(hex: "FFFFFF")
  ]
  
  static let uiColors: [UIColor?] = [
    UIColor.red,
    UIColor.green,
    UIColor.blue,
    UIColor(red: 0, green: 0, blue: 0, alpha: 1.0),
    UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  ]
  
  static let hslColors: [Color?] = [
    Color(hue: 0, saturation: 1.0, luminance: 0.5),  // (0°,100%,50%)
    Color(hue: 120, saturation: 1.0, luminance: 0.5),  // (120°,100%,50%)
    Color(hue: 240, saturation: 1.0, luminance: 0.5),  // (240°,100%,50%)
    Color(hue: 0, saturation: 0, luminance: 0),  // (0°,0%,0%)
    Color(hue: 0, saturation: 0, luminance: 1.0)  // (0°,0%,100%)
  ]
  
  static let hsvColors: [Color?] = [
    Color(hue: 0, saturation: 1.0, value: 1.0), // (0°,100%,100%)
    Color(hue: 120, saturation: 1.0, value: 1.0), // (120°,100%,100%)
    Color(hue: 240, saturation: 1.0, value: 1.0), // (240°,100%,100%)
    Color(hue: 0, saturation: 0, value: 0), // (0°,0%,0%)
    Color(hue: 0, saturation: 0, value: 1.0) // (0°,0%,100%)
  ]
  
  static let cmykColors: [Color?] = [
    Color(cyan: 0, magenta: 1.0, yellow: 1.0, key: 0),
    Color(cyan: 1.0, magenta: 0, yellow: 1.0, key: 0),
    Color(cyan: 1.0, magenta: 1.0, yellow: 0, key: 0),
    Color(cyan: 0, magenta: 0, yellow: 0, key: 1.0),
    Color(cyan: 0, magenta: 0, yellow: 0, key: 0)
  ]
}

