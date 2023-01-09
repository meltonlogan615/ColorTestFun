//
//  CodableColor.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/9/23.
//

import UIKit

@propertyWrapper
struct CodableColor {
  var wrappedValue: UIColor?
}

extension CodableColor: Codable {
  init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    let data = try container.decode(Data.self)
    guard let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data) else {
      throw DecodingError.dataCorruptedError(
        in: container,
        debugDescription: "Invalid color"
      )
    }
    wrappedValue = color
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    guard let value = wrappedValue else { return }
    let data = try NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
    try container.encode(data)
  }
}
