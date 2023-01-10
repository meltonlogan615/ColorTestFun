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
  
  func test_conversionToCMYK_fromRGB() {
    let test = TestData.rgbColors.map {
      color.convertToCMYKUsing(red: $0!.red, green: $0!.green, blue: $0!.blue)
    }
    XCTAssertEqual(cmyk[0]?.cyan, test[0]?.cyan)
    XCTAssertEqual(cmyk[0]?.magenta, test[0]?.magenta)
    XCTAssertEqual(cmyk[0]?.yellow, test[0]?.yellow)
    XCTAssertEqual(cmyk[0]?.key, test[0]?.key)
    
    XCTAssertEqual(cmyk[1]?.cyan, test[1]?.cyan)
    XCTAssertEqual(cmyk[1]?.magenta, test[1]?.magenta)
    XCTAssertEqual(cmyk[1]?.yellow, test[1]?.yellow)
    XCTAssertEqual(cmyk[1]?.key, test[1]?.key)
    
    XCTAssertEqual(cmyk[2]?.cyan, test[2]?.cyan)
    XCTAssertEqual(cmyk[2]?.magenta, test[2]?.magenta)
    XCTAssertEqual(cmyk[2]?.yellow, test[2]?.yellow)
    XCTAssertEqual(cmyk[2]?.key, test[2]?.key)
    
    XCTAssertEqual(cmyk[3]?.cyan, test[3]?.cyan)
    XCTAssertEqual(cmyk[3]?.magenta, test[3]?.magenta)
    XCTAssertEqual(cmyk[3]?.yellow, test[3]?.yellow)
    XCTAssertEqual(cmyk[3]?.key, test[3]?.key)
    
    XCTAssertEqual(cmyk[4]?.cyan, test[4]?.cyan)
    XCTAssertEqual(cmyk[4]?.magenta, test[4]?.magenta)
    XCTAssertEqual(cmyk[4]?.yellow, test[4]?.yellow)
    XCTAssertEqual(cmyk[4]?.key, test[4]?.key)
  }
  
  func test_conversionToCMYK_fromHex() {
    let test = TestData.hexColors.map {
      color.convertToCMYKUsing(hex: $0!.hex!)
    }
    XCTAssertEqual(cmyk[0]?.cyan, test[0]?.cyan)
    XCTAssertEqual(cmyk[0]?.magenta, test[0]?.magenta)
    XCTAssertEqual(cmyk[0]?.yellow, test[0]?.yellow)
    XCTAssertEqual(cmyk[0]?.key, test[0]?.key)
    
    XCTAssertEqual(cmyk[1]?.cyan, test[1]?.cyan)
    XCTAssertEqual(cmyk[1]?.magenta, test[1]?.magenta)
    XCTAssertEqual(cmyk[1]?.yellow, test[1]?.yellow)
    XCTAssertEqual(cmyk[1]?.key, test[1]?.key)
    
    XCTAssertEqual(cmyk[2]?.cyan, test[2]?.cyan)
    XCTAssertEqual(cmyk[2]?.magenta, test[2]?.magenta)
    XCTAssertEqual(cmyk[2]?.yellow, test[2]?.yellow)
    XCTAssertEqual(cmyk[2]?.key, test[2]?.key)
    
    XCTAssertEqual(cmyk[3]?.cyan, test[3]?.cyan)
    XCTAssertEqual(cmyk[3]?.magenta, test[3]?.magenta)
    XCTAssertEqual(cmyk[3]?.yellow, test[3]?.yellow)
    XCTAssertEqual(cmyk[3]?.key, test[3]?.key)
    
    XCTAssertEqual(cmyk[4]?.cyan, test[4]?.cyan)
    XCTAssertEqual(cmyk[4]?.magenta, test[4]?.magenta)
    XCTAssertEqual(cmyk[4]?.yellow, test[4]?.yellow)
    XCTAssertEqual(cmyk[4]?.key, test[4]?.key)
  }
  
  func test_conversionToCMYK_fromUIColor() {
    let test = TestData.uiColors.map {
      color.convertToCMYKUsing(uiColor: $0)
    }
    XCTAssertEqual(cmyk[0]?.cyan, test[0]?.cyan)
    XCTAssertEqual(cmyk[0]?.magenta, test[0]?.magenta)
    XCTAssertEqual(cmyk[0]?.yellow, test[0]?.yellow)
    XCTAssertEqual(cmyk[0]?.key, test[0]?.key)
    
    XCTAssertEqual(cmyk[1]?.cyan, test[1]?.cyan)
    XCTAssertEqual(cmyk[1]?.magenta, test[1]?.magenta)
    XCTAssertEqual(cmyk[1]?.yellow, test[1]?.yellow)
    XCTAssertEqual(cmyk[1]?.key, test[1]?.key)
    
    XCTAssertEqual(cmyk[2]?.cyan, test[2]?.cyan)
    XCTAssertEqual(cmyk[2]?.magenta, test[2]?.magenta)
    XCTAssertEqual(cmyk[2]?.yellow, test[2]?.yellow)
    XCTAssertEqual(cmyk[2]?.key, test[2]?.key)
    
    XCTAssertEqual(cmyk[3]?.cyan, test[3]?.cyan)
    XCTAssertEqual(cmyk[3]?.magenta, test[3]?.magenta)
    XCTAssertEqual(cmyk[3]?.yellow, test[3]?.yellow)
    XCTAssertEqual(cmyk[3]?.key, test[3]?.key)
    
    XCTAssertEqual(cmyk[4]?.cyan, test[4]?.cyan)
    XCTAssertEqual(cmyk[4]?.magenta, test[4]?.magenta)
    XCTAssertEqual(cmyk[4]?.yellow, test[4]?.yellow)
    XCTAssertEqual(cmyk[4]?.key, test[4]?.key)
  }
  
  func test_conversionToCMYK_fromHSL() {
    let test = TestData.hslColors.map {
      color.convertToCMYKUsing(hue: $0!.hue!, saturation: $0!.saturation!, luminance: $0!.luminance!)
    }
    XCTAssertEqual(cmyk[0]?.cyan, test[0]?.cyan)
    XCTAssertEqual(cmyk[0]?.magenta, test[0]?.magenta)
    XCTAssertEqual(cmyk[0]?.yellow, test[0]?.yellow)
    XCTAssertEqual(cmyk[0]?.key, test[0]?.key)
    
    XCTAssertEqual(cmyk[1]?.cyan, test[1]?.cyan)
    XCTAssertEqual(cmyk[1]?.magenta, test[1]?.magenta)
    XCTAssertEqual(cmyk[1]?.yellow, test[1]?.yellow)
    XCTAssertEqual(cmyk[1]?.key, test[1]?.key)
    
    XCTAssertEqual(cmyk[2]?.cyan, test[2]?.cyan)
    XCTAssertEqual(cmyk[2]?.magenta, test[2]?.magenta)
    XCTAssertEqual(cmyk[2]?.yellow, test[2]?.yellow)
    XCTAssertEqual(cmyk[2]?.key, test[2]?.key)
    
    XCTAssertEqual(cmyk[3]?.cyan, test[3]?.cyan)
    XCTAssertEqual(cmyk[3]?.magenta, test[3]?.magenta)
    XCTAssertEqual(cmyk[3]?.yellow, test[3]?.yellow)
    XCTAssertEqual(cmyk[3]?.key, test[3]?.key)
    
    XCTAssertEqual(cmyk[4]?.cyan, test[4]?.cyan)
    XCTAssertEqual(cmyk[4]?.magenta, test[4]?.magenta)
    XCTAssertEqual(cmyk[4]?.yellow, test[4]?.yellow)
    XCTAssertEqual(cmyk[4]?.key, test[4]?.key)
  }
  
  func test_conversionToCMYK_fromHSV() {
    let test = TestData.hsvColors.map {
      color.convertToCMYKUsing(hue: $0!.hue!, saturation: $0!.saturation!, value: $0!.value!)
    }
    XCTAssertEqual(cmyk[0]?.cyan, test[0]?.cyan)
    XCTAssertEqual(cmyk[0]?.magenta, test[0]?.magenta)
    XCTAssertEqual(cmyk[0]?.yellow, test[0]?.yellow)
    XCTAssertEqual(cmyk[0]?.key, test[0]?.key)
    
    XCTAssertEqual(cmyk[1]?.cyan, test[1]?.cyan)
    XCTAssertEqual(cmyk[1]?.magenta, test[1]?.magenta)
    XCTAssertEqual(cmyk[1]?.yellow, test[1]?.yellow)
    XCTAssertEqual(cmyk[1]?.key, test[1]?.key)
    
    XCTAssertEqual(cmyk[2]?.cyan, test[2]?.cyan)
    XCTAssertEqual(cmyk[2]?.magenta, test[2]?.magenta)
    XCTAssertEqual(cmyk[2]?.yellow, test[2]?.yellow)
    XCTAssertEqual(cmyk[2]?.key, test[2]?.key)
    
    XCTAssertEqual(cmyk[3]?.cyan, test[3]?.cyan)
    XCTAssertEqual(cmyk[3]?.magenta, test[3]?.magenta)
    XCTAssertEqual(cmyk[3]?.yellow, test[3]?.yellow)
    XCTAssertEqual(cmyk[3]?.key, test[3]?.key)
    
    XCTAssertEqual(cmyk[4]?.cyan, test[4]?.cyan)
    XCTAssertEqual(cmyk[4]?.magenta, test[4]?.magenta)
    XCTAssertEqual(cmyk[4]?.yellow, test[4]?.yellow)
    XCTAssertEqual(cmyk[4]?.key, test[4]?.key)
  }
}
