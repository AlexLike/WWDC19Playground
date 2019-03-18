//
//  PublicFunctions.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import UIKit
import PlaygroundSupport

public func addBirthdateActionView(withDate date: Date?) -> Bool {
  guard let date = date else { return false }
  Book_Sources.sendValue(date)
  return true
}

public func addEmojiActionView(withEmoji emoji: String?) -> Bool {
  guard let emoji = emoji, emoji.underestimatedCount == 1 else { return false }
  Book_Sources.sendValue(emoji)
  return true
}

public func addPhoneActionView() -> Bool {
  Book_Sources.sendValue(true)
  return true
}

public func addLanguagesActionView(forLanguages languages: [Language]?) -> Bool {
  guard let languages = languages, !languages.isEmpty else { return false }
  var languageStrings = [PlaygroundValue]()
  for language in languages {
    let languagePlaygroundValue = PlaygroundValue.string(language.rawValue)
    languageStrings.append(languagePlaygroundValue)
  }
  let languageStringsPlaygroundValue = PlaygroundValue.array(languageStrings)
  Book_Sources.sendValue(languageStringsPlaygroundValue)
  return true
}

public func updateProfileImageView(withImage image: UIImage?) -> Bool {
  guard let image = image else { return false }
  Book_Sources.sendValue(image)
  return true
}

public func updateCardViewLayer(toGradient gradient: Gradient?) -> Bool {
  guard let gradient = gradient else { return false }
  Book_Sources.sendValue(gradient.rawValue)
  return true
}
