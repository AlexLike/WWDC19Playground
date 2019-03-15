//
//  ActionView.swift
//  Book_Sources
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit

class ActionView: UIView {
  
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
    layer.cornerRadius = 10
    layer.masksToBounds = true
    // Border
    layer.borderWidth = 3
    layer.borderColor = backgroundColor?.cgColor
  }
  
}
