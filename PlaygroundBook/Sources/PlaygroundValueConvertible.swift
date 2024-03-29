//
//  PlaygroundValueConvertible.swift
//  Book_Sources
//
//  Created by Alexander Zank on 17.03.19.
//

import UIKit
import PlaygroundSupport

public protocol PlaygroundValueConvertible {
  func asPlaygroundValue() -> PlaygroundValue
}

extension Date: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.date(self)
  }
}

extension String: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.string(self)
  }
}

extension Bool: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.boolean(self)
  }
}

extension UIImage: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.data(self.pngData() ?? Data())
  }
}

extension Int: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return PlaygroundValue.integer(self)
  }
}

extension PlaygroundValue: PlaygroundValueConvertible {
  public func asPlaygroundValue() -> PlaygroundValue {
    return self
  }
}
