//
//  ColorGroup.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//

import Foundation

struct ColorGroup: Codable, Equatable, Comparable {
  var name: String
  var colors: [Color?]
  
  static func < (lhs: ColorGroup, rhs: ColorGroup) -> Bool {
    return lhs.name < rhs.name
  }
  
}
