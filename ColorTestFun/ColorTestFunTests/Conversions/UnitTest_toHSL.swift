//
//  UnitTest_toHSL.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_toHSL: XCTestCase {
  let color = Color()
  let hsl = TestData.hslColors
  
  func test_conversionToHSL_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHSLUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)
    }
    XCTAssertEqual(hsl[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsl[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsl[0]?.luminance, test[0]?.luminance)
    XCTAssertEqual(hsl[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsl[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsl[1]?.luminance, test[1]?.luminance)
    XCTAssertEqual(hsl[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsl[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsl[2]?.luminance, test[2]?.luminance)
    XCTAssertEqual(hsl[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsl[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsl[3]?.luminance, test[3]?.luminance)
    XCTAssertEqual(hsl[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsl[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsl[4]?.luminance, test[4]?.luminance)
  }
  
  func test_conversionToHSL_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToHSLUsing(hex: $0!.hex)
    }
    XCTAssertEqual(hsl[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsl[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsl[0]?.luminance, test[0]?.luminance)
    XCTAssertEqual(hsl[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsl[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsl[1]?.luminance, test[1]?.luminance)
    XCTAssertEqual(hsl[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsl[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsl[2]?.luminance, test[2]?.luminance)
    XCTAssertEqual(hsl[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsl[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsl[3]?.luminance, test[3]?.luminance)
    XCTAssertEqual(hsl[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsl[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsl[4]?.luminance, test[4]?.luminance)
  }
  
  func test_conversionToHSL_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToHSLUsing(uiColor: $0)
    }
    XCTAssertEqual(hsl[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsl[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsl[0]?.luminance, test[0]?.luminance)
    XCTAssertEqual(hsl[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsl[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsl[1]?.luminance, test[1]?.luminance)
    XCTAssertEqual(hsl[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsl[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsl[2]?.luminance, test[2]?.luminance)
    XCTAssertEqual(hsl[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsl[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsl[3]?.luminance, test[3]?.luminance)
    XCTAssertEqual(hsl[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsl[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsl[4]?.luminance, test[4]?.luminance)
  }
  
  func test_conversionToHSL_fromHSV() {
    let test = TestData.hsvColors.map {
      color.convertToHSLUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
    }
    XCTAssertEqual(hsl[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsl[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsl[0]?.luminance, test[0]?.luminance)
    XCTAssertEqual(hsl[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsl[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsl[1]?.luminance, test[1]?.luminance)
    XCTAssertEqual(hsl[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsl[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsl[2]?.luminance, test[2]?.luminance)
    XCTAssertEqual(hsl[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsl[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsl[3]?.luminance, test[3]?.luminance)
    XCTAssertEqual(hsl[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsl[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsl[4]?.luminance, test[4]?.luminance)
  }
  
  func test_conversionToHSL_fromCMYK() {
    let test = TestData.cmykColors.map {
      color.convertToHSLUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
    }
    XCTAssertEqual(hsl[0]?.hue, test[0]?.hue)
    XCTAssertEqual(hsl[0]?.saturation, test[0]?.saturation)
    XCTAssertEqual(hsl[0]?.luminance, test[0]?.luminance)
    XCTAssertEqual(hsl[1]?.hue, test[1]?.hue)
    XCTAssertEqual(hsl[1]?.saturation, test[1]?.saturation)
    XCTAssertEqual(hsl[1]?.luminance, test[1]?.luminance)
    XCTAssertEqual(hsl[2]?.hue, test[2]?.hue)
    XCTAssertEqual(hsl[2]?.saturation, test[2]?.saturation)
    XCTAssertEqual(hsl[2]?.luminance, test[2]?.luminance)
    XCTAssertEqual(hsl[3]?.hue, test[3]?.hue)
    XCTAssertEqual(hsl[3]?.saturation, test[3]?.saturation)
    XCTAssertEqual(hsl[3]?.luminance, test[3]?.luminance)
    XCTAssertEqual(hsl[4]?.hue, test[4]?.hue)
    XCTAssertEqual(hsl[4]?.saturation, test[4]?.saturation)
    XCTAssertEqual(hsl[4]?.luminance, test[4]?.luminance)
  }
}
