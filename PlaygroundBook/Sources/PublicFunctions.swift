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
