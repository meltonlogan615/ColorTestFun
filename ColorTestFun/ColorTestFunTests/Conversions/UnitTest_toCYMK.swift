//
//  UnitTest_toCYMK.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_toCYMK: XCTestCase {
  let color = Color()
  let cmyk = TestData.cmykColors
  
  func skip_test_conversionToCMYK_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHSLUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)
    }
    XCTAssertEqual(cmyk, test)
  }
  
  func skip_test_conversionToCMYK_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToRGBUsing(hex: $0!.hex!)
    }
    XCTAssertEqual(cmyk, test)
  }
  
  func skip_test_conversionToCMYK_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToRGBUsing(uiColor: $0)
    }
    XCTAssertEqual(cmyk, test)
  }
  
  func skip_test_conversionToCMYK_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(cmyk, test)
  }
  
  func skip_test_conversionToCMYK_fromHSV() {
    let test = TestData.hsvColors.map {
      color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
    }
    XCTAssertEqual(cmyk, test)
  }
}
