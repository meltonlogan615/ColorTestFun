//
//  UnitTest_toHSV.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_toHSV: XCTestCase {
  let color = Color()
  let hsv = TestData.hsvColors
  
  func skip_test_conversionToHSV_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHSLUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)
    }
    XCTAssert(hsv == test)
  }
  
  func skip_test_conversionToHSV_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToRGBUsing(hex: $0!.hex!)
    }
    XCTAssertEqual(hsv[0]!.hue, test[0]!.hue)
    XCTAssertEqual(hsv[0]!.saturation, test[0]!.saturation)
    XCTAssertEqual(hsv[0]!.value, test[0]!.value)
  }
  
  func skip_test_conversionToHSV_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToRGBUsing(uiColor: $0)
    }
    XCTAssertEqual(hsv[0]!.hue, test[0]!.hue)
    XCTAssertEqual(hsv[0]!.saturation, test[0]!.saturation)
    XCTAssertEqual(hsv[0]!.value, test[0]!.value)
  }
  
  func skip_test_conversionToHSV_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(hsv[0]!.hue, test[0]!.hue)
    XCTAssertEqual(hsv[0]!.saturation, test[0]!.saturation)
    XCTAssertEqual(hsv[0]!.value, test[0]!.value)
  }
  
  func skip_test_conversionToHSV_fromCMYK() {
    let test = TestData.cmykColors.map {
      color.convertToRGBUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
    }
    XCTAssertEqual(hsv[0]!.hue, test[0]!.hue)
    XCTAssertEqual(hsv[0]!.saturation, test[0]!.saturation)
    XCTAssertEqual(hsv[0]!.value, test[0]!.value)
  }
}
