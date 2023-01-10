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
  
  func test_conversionToHSV_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHSVUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)
    }
    XCTAssertEqual(hsv[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsv[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsv[0]?.value, test[0]?.value)
    XCTAssertEqual(hsv[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsv[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsv[1]?.value, test[1]?.value)
    XCTAssertEqual(hsv[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsv[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsv[2]?.value, test[2]?.value)
    XCTAssertEqual(hsv[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsv[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsv[3]?.value, test[3]?.value)
    XCTAssertEqual(hsv[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsv[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsv[4]?.value, test[4]?.value)
  }
  
  func test_conversionToHSV_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToHSVUsing(hex: $0!.hex!)
    }
    XCTAssertEqual(hsv[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsv[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsv[0]?.value, test[0]?.value)
    XCTAssertEqual(hsv[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsv[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsv[1]?.value, test[1]?.value)
    XCTAssertEqual(hsv[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsv[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsv[2]?.value, test[2]?.value)
    XCTAssertEqual(hsv[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsv[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsv[3]?.value, test[3]?.value)
    XCTAssertEqual(hsv[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsv[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsv[4]?.value, test[4]?.value)
  }
  
  func test_conversionToHSV_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToHSVUsing(uiColor: $0)
    }
    XCTAssertEqual(hsv[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsv[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsv[0]?.value, test[0]?.value)
    XCTAssertEqual(hsv[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsv[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsv[1]?.value, test[1]?.value)
    XCTAssertEqual(hsv[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsv[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsv[2]?.value, test[2]?.value)
    XCTAssertEqual(hsv[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsv[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsv[3]?.value, test[3]?.value)
    XCTAssertEqual(hsv[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsv[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsv[4]?.value, test[4]?.value)
  }
  
  func test_conversionToHSV_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToHSVUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(hsv[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsv[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsv[0]?.value, test[0]?.value)
    XCTAssertEqual(hsv[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsv[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsv[1]?.value, test[1]?.value)
    XCTAssertEqual(hsv[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsv[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsv[2]?.value, test[2]?.value)
    XCTAssertEqual(hsv[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsv[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsv[3]?.value, test[3]?.value)
    XCTAssertEqual(hsv[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsv[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsv[4]?.value, test[4]?.value)
  }
  
  func test_conversionToHSV_fromCMYK() {
    let test = TestData.cmykColors.map {
      color.convertToHSVUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
    }
    XCTAssertEqual(hsv[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsv[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsv[0]?.value, test[0]?.value)
    XCTAssertEqual(hsv[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsv[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsv[1]?.value, test[1]?.value)
    XCTAssertEqual(hsv[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsv[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsv[2]?.value, test[2]?.value)
    XCTAssertEqual(hsv[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsv[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsv[3]?.value, test[3]?.value)
    XCTAssertEqual(hsv[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsv[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsv[4]?.value, test[4]?.value)
  }
}
