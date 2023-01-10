//
//  UnitTest_Hex2.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_ToHEX: XCTestCase {
  let color = Color()
  let hex = TestData.hexColors
   
  func test_conversionToHex_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToHexUsing(red: $0!.red, green: $0!.green, blue: $0!.blue)
    }
//    XCTAssertEqual(hex[0]?.hex, test[0]?.hex)
    XCTAssertEqual(hex[1]?.hex, test[1]?.hex)
    XCTAssertEqual(hex[2]?.hex, test[2]?.hex)
    XCTAssertEqual(hex[3]?.hex, test[3]?.hex)
    XCTAssertEqual(hex[4]?.hex, test[4]?.hex)
  }
  
  func test_conversionToHex_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToHexUsing(uiColor: $0!)
    }
    XCTAssertEqual(hex[0]?.hex, test[0]?.hex)
    XCTAssertEqual(hex[1]?.hex, test[1]?.hex)
    XCTAssertEqual(hex[2]?.hex, test[2]?.hex)
    XCTAssertEqual(hex[3]?.hex, test[3]?.hex)
    XCTAssertEqual(hex[4]?.hex, test[4]?.hex)
  }
  
  func test_conversionToHex_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToHexUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(hex[0]?.hex, test[0]?.hex)
    XCTAssertEqual(hex[1]?.hex, test[1]?.hex)
    XCTAssertEqual(hex[2]?.hex, test[2]?.hex)
    XCTAssertEqual(hex[3]?.hex, test[3]?.hex)
    XCTAssertEqual(hex[4]?.hex, test[4]?.hex)
  }
  
  func test_conversionToHex_fromHSV() {
    let test = TestData.hsvColors.map {
      color.convertToHexUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
    }
    XCTAssertEqual(hex[0]?.hex, test[0]?.hex)
    XCTAssertEqual(hex[1]?.hex, test[1]?.hex)
    XCTAssertEqual(hex[2]?.hex, test[2]?.hex)
    XCTAssertEqual(hex[3]?.hex, test[3]?.hex)
    XCTAssertEqual(hex[4]?.hex, test[4]?.hex)
  }
  
  func test_conversionToHex_fromCMYK() {
    let test = TestData.cmykColors.map {
      color.convertToHexUsing(cyan: $0!.cyan!, magenta: $0!.magenta!, yellow: $0!.yellow!, key: $0!.key!)
    }
    XCTAssertEqual(hex[0]?.hex, test[0]?.hex)
    XCTAssertEqual(hex[1]?.hex, test[1]?.hex)
    XCTAssertEqual(hex[2]?.hex, test[2]?.hex)
    XCTAssertEqual(hex[3]?.hex, test[3]?.hex)
    XCTAssertEqual(hex[4]?.hex, test[4]?.hex)
  }
}

