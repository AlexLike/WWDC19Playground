//
//  CardInformation.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import UIKit

public struct CardInformation {
  
  // MARK: - Properties with defaults
  public var name: String = "a human"
  public var birthdate: Date? = nil
  public var image: UIImage? = nil
  public var favoriteEmoji: String = "😃"
  public var passionEmojis: String = "💻🕺📸"
  public var occupation: String = "existing"
  public var spokenLanguages: [Locale] = [Locale(identifier: "de")]
  
  
  // MARK: - Object lifecycle
  
  // Initializer for default object
  public init() {
  }
  
  // Initializer for custom object
  public init(name: String, birthdate: Date?, image: UIImage?, favoriteEmoji: String, passionEmojis: String, occupation: String, spokenLanguages: [Locale]) {
    self.name = name
    self.birthdate = birthdate
    self.image = image
    self.favoriteEmoji = favoriteEmoji
    self.passionEmojis = passionEmojis
    self.occupation = occupation
    self.spokenLanguages = spokenLanguages
  }
  
}
