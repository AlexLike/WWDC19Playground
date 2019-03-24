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
  let dictionary = ["displayPhone": PlaygroundValue.boolean(true)]
  Book_Sources.sendValue(PlaygroundValue.dictionary(dictionary))
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

public func updateProfileImageView(withImage image: UIImage?) {
  guard let image = image else { return }
  Book_Sources.sendValue(image)
}

public func updateCardViewLayer(toGradient gradient: Gradient?) {
  guard let gradient = gradient else { return }
  Book_Sources.sendValue(gradient.rawValue)
}

public func prepareForVoiceOver() {
  let dictionary = ["displayVoiceOver": PlaygroundValue.boolean(true)]
  Book_Sources.sendValue(PlaygroundValue.dictionary(dictionary))
}

public func prepareForARKit() {
  let dictionary = ["displayARKit": PlaygroundValue.boolean(true)]
  Book_Sources.sendValue(PlaygroundValue.dictionary(dictionary))
}

public func loadAlexCard() {
  let dictionary = ["loadAlexCard": PlaygroundValue.boolean(true)]
  Book_Sources.sendValue(PlaygroundValue.dictionary(dictionary))
}
