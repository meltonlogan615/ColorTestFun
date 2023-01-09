//
//  UnitTest_Tetratic.swift
//  ColorTestFunTests
//
//  Created by Logan Melton on 1/9/23.
//

import XCTest
@testable import ColorTestFun

final class UnitTest_Tetratic: XCTestCase {
  let color = Color()
  
  func skip_test_gettingTetratcColors_usingRGB() {
    
  }
  
  func skip_test_gettingTetratcColors_usingHex() {
    let hex = Color(hex: "")
    
    XCTAssertEqual(hex, hex)
  }
  
  func skip_test_gettingTetratcColors_usingUIColor() {
    let color = Color(uiColor: UIColor.blue)
    
    XCTAssertEqual(color, color)
  }
  
  func skip_test_gettingTetratcColors_usingHSL() {
    let hsl = Color(hue: 0, saturation: 0, luminance: 0)
    
    XCTAssertEqual(hsl, hsl)
  }
  
  func skip_test_gettingTetratcColors_usingHSV() {
    let hsv = Color(hue: 0, saturation: 0, value: 0)
    
    XCTAssertEqual(hsv, hsv)
  }
  
  func skip_test_gettingTetratcColors_usingCYMK() {
    let cymk = Color(cyan: 0, magenta: 0, yellow: 0, key: 0)
    
    XCTAssertEqual(cymk, cymk)
  }
}
