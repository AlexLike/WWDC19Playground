//
//  ActionView.swift
//  Book_Sources
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit

class ActionView: UIButton {
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setAppearance()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setAppearance()
  }
  
  
  // MARK: - UIButton methods
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    // Shrink the action view
    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .preferredFramesPerSecond60, animations: {
      self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }) { _ in
      UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: .preferredFramesPerSecond60, animations: {
        self.transform = CGAffineTransform(scaleX: 1, y: 1)
      })
    }
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
