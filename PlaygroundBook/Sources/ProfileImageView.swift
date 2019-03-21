//
//  ProfileImageView.swift
//  Book_Sources
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit
import PlaygroundSupport

class ProfileImageView: UIImageView {
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setAppearance()
    setCornerRadius()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setAppearance()
    setCornerRadius()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setCornerRadius()
  }
  
  
  // MARK: - Private methods
  
  private func setAppearance() {
    // Default image
    image = UIImage(named: "Placeholder")
  }
  
  private func setCornerRadius() {
    // Radius
    layer.cornerRadius = bounds.width / 2
    layer.masksToBounds = true
  }
  
}
