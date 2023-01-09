//
//  ColorTestFunTests.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class ColorTestFunTests: XCTestCase {
  let color = Color()
  let rgb = TestData.rgbColors
  
  func test_conversionToRGB_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToRGBUsing(hex: $0!.hex!)
    }
    XCTAssertEqual(rgb, test)
  }
  
  func test_conversionToRGB_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToRGBUsing(uiColor: $0)
    }
    XCTAssertEqual(rgb, test)
  }
  
  func test_conversionToRGB_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(rgb, test)
  }
  
  func test_conversionToRGB_fromHSV() {
    let test = TestData.hsvColors.map {
      color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
    }
    XCTAssertEqual(rgb, test)
  }
  
  func test_converstionToRGB_fromCMYK() {
    let test = TestData.cmykColors.map {
      color.convertToRGBUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
    }
    XCTAssertEqual(rgb, test)
  }
}
