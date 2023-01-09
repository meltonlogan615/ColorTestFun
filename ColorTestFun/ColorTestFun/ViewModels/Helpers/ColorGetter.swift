//
//  ColorGetter.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import Foundation

class ColorGetter {
  func getColors() -> [Color] {
    var colorsDecoded = [Color]()
    if let source = Bundle.main.url(forResource: "colors", withExtension: ".json") {
      do {
        let data = try Data(contentsOf: source)
        let decoder = JSONDecoder()
        let colors = try decoder.decode([Color].self, from: data)
        colorsDecoded = colors
      } catch {
        print(error)
      }
    }
    return colorsDecoded
  }
}

