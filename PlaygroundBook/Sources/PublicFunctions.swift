//
//  PublicFunctions.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import Foundation

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
