//
//  CardInformation.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import UIKit
import PlaygroundSupport

public struct CardInformation: PlaygroundValueConvertible {
  
  // MARK: - Properties with defaults
  public var name: String = "a human"
  public var passionEmojis: String = "💻🕺📸"
  public var occupation: String = "existing"
  
  
  // MARK: - Object lifecycle
  
  // Initializer for default object
  public init() {
  }
  
  // Initializer for custom object
  public init(name: String, passionEmojis: String, occupation: String) {
    self.name = name
    self.passionEmojis = passionEmojis
    self.occupation = occupation
  }
  
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.dictionary(["name": .string(name), "passionEmojis": .string(passionEmojis), "occupation": .string(occupation)])
  }
}
