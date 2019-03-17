//
//  DateExtension.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import Foundation
import PlaygroundSupport

extension Date: PlaygroundValueConvertible {
  
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.date(self)
  }
  
}
