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
  
  func skip_test_conversionToHSL_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHSLUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)!
    }
    XCTAssertEqual(hsl, test)
  }
  
    func skip_test_conversionToHSL_fromHex() {
      let test = TestData.hexColors.map {
        color.convertToRGBUsing(hex: $0!.hex!)
      }
      XCTAssertEqual(hsl, test)
    }
  
    func skip_test_conversionToHSL_fromUIColor() {
      let test = TestData.uiColors.map {
        color.convertToRGBUsing(uiColor: $0)
      }
      XCTAssertEqual(hsl, test)
    }
  
    func skip_test_conversionToHSL_fromHSV() {
      let test = TestData.hsvColors.map {
        color.convertToRGBUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
      }
      XCTAssertEqual(hsl, test)
    }
  
    func skip_test_conversionToHSL_fromCMYK() {
      let test = TestData.cmykColors.map {
        color.convertToRGBUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
      }
      XCTAssertEqual(hsl, test)
    }
  
}
