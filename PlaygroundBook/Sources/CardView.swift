//
//  CardView.swift
//  PlaygroundBook
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit

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
  
  
  // MARK: - Private methods
  
  private func setAppearance() {
    // Radius
    layer.cornerRadius = 45
    backgroundColor = #colorLiteral(red: 0, green: 0.8650887609, blue: 0.320767343, alpha: 1)
  }
  
}
