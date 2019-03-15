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
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setAppearance()
  }
  
  
  // MARK: - Private methods
  
  private func setAppearance() {
    // Radius
    layer.cornerRadius = bounds.width / 2
    layer.masksToBounds = true
    // Default image
    image = UIImage(named: "Placeholder")
  }
  
}
