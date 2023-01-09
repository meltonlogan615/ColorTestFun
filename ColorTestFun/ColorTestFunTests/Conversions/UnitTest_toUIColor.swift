//
//  UnitTest_toUIColor.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_toUIColor: XCTestCase {
    let color = Color()
    let uiColor = TestData.uiColors
    
    func test_conversionToUIColor_fromRGB() {
      let test = TestData.rgbColors.map {
        color.convertToUIColorUsing(red: $0!.red!, green: $0!.green!, blue: $0!.blue!)
      }
      XCTAssertEqual(uiColor, test)
    }
    
    
    func test_conversionToUIColor_fromHex() {
      let test = TestData.hexColors.map {
        color.convertToUIColorUsing(hex: $0!.hex)
      }
      XCTAssertEqual(uiColor, test)
    }
    
    
    func test_conversionToUIColor_fromHSL() {
      let test = TestData.hslColors.map {
        color.convertToUIColorUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
      }
      XCTAssertEqual(uiColor, test)
    }
    
    
    func test_conversionToUIColor_fromHSV() {
      let test = TestData.hsvColors.map {
        color.convertToUIColorUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
      }
      XCTAssertEqual(uiColor, test)
    }
    
    
    func test_conversionToUIColor_fromCMYK() {
      let test = TestData.cmykColors.map {
        color.convertToUIColorUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
      }
      XCTAssertEqual(uiColor, test)
    }
  }
