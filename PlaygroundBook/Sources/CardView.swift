//
//  CardView.swift
//  PlaygroundBook
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit
import PlaygroundSupport

class CardView: UIView {
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setAppearance()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setAppearance()
  }
  
  // MARK: - Overrides
  
  override class var layerClass: AnyClass {
    // Use CAGradientLayer for the view's layer
    return CAGradientLayer.self
  }
  
  
  // MARK: - Private methods
  
  private func setAppearance() {
    // Cast layer to correct class
    guard let layer = layer as? CAGradientLayer else {
      print("CardView: Wasn't able to cast layer to CAGradientLayer.")
      return
    }
    // Radius
    layer.cornerRadius = 45
    // Default background gradient
    layer.colors = [
      (UIColor(named: "Orange") ?? UIColor.orange).cgColor,
      (UIColor(named: "Yellow") ?? UIColor.yellow).cgColor
    ]
    // Shadow
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.15
    layer.shadowOffset = CGSize(width: 0, height: 3)
    layer.shadowRadius = 5
  }
  
}
