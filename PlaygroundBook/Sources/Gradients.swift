//
//  Gradients.swift
//  Book_Sources
//
//  Created by Alexander Zank on 18.03.19.
//

import UIKit

public enum Gradient: Int {
  case orangeYellow = 0
  case pinkPurple = 1
  case deepBlue = 2
  case brightGreen = 3
  case bloodyMary = 4
}

func cgColorArrayForGradient(_ gradient: Gradient) -> [CGColor] {
  switch gradient {
  case .orangeYellow: return [UIColor(named: "Orange")!.cgColor, UIColor(named: "Yellow")!.cgColor]
  case .pinkPurple: return [UIColor(red: 0.98, green: 0.33, blue: 0.78, alpha: 1.00).cgColor, UIColor(red: 0.73, green: 0.11, blue: 0.45, alpha: 1.00).cgColor]
  case .deepBlue: return [UIColor(red: 0.22, green: 0.42, blue: 0.99, alpha: 1.00).cgColor, UIColor(red: 0.00, green: 0.00, blue: 1.00, alpha: 1.00).cgColor]
  case .brightGreen: return [UIColor(red: 0.34, green: 0.67, blue: 0.18, alpha: 1.00).cgColor, UIColor(red: 0.66, green: 0.88, blue: 0.39, alpha: 1.00).cgColor]
  case .bloodyMary: return [UIColor(red: 0.87, green: 0.14, blue: 0.46, alpha: 1.00).cgColor, UIColor(red: 1.00, green: 0.32, blue: 0.18, alpha: 1.00).cgColor]
  }
}
