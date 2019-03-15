//
//  BottomButton.swift
//  Book_Sources
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit

class BottomButton: UIButton {
  
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
  }
  
  private func setupForIconIfNeeded() {
    guard image(for: .normal) != nil,
      let imageView = imageView,
      let titleLabel = titleLabel else { return }
    // Icon View
    imageView.tintColor = UIColor.white
    adjustsImageWhenHighlighted = false
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.widthAnchor.constraint(equalToConstant: 22).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 22).isActive = true
    imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    // Text View
    if title(for: .normal)?.isEmpty ?? true {
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    } else {
      let imageViewCenterXOffset = -(22 + titleLabel.bounds.width - 7) / 2
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: imageViewCenterXOffset).isActive = true
      titleLabel.translatesAutoresizingMaskIntoConstraints = false
      titleEdgeInsets = UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 0)
    }
  }
  
}
