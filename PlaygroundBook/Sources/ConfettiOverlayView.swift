//
//  ConfettiOverlayView.swift
//  Book_Sources
//
//  Created by Alexander Zank on 15.03.19.
//

import UIKit

class ConfettiOverlayView: UIView {
  
  // MARK: - Properties
  
  private var particleEmitter: CAEmitterLayer!
  
  
  // MARK: - Initialization
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setAppearanceAndSetupParticles()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setAppearanceAndSetupParticles()
  }
  
  
  // MARK: - Public methods
  
  public func startConfetti() {
    self.isHidden = false
    particleEmitter.birthRate = 1
  }
  
  public func stopConfetti() {
    particleEmitter.birthRate = 0
  }
  
  
  // MARK: - Private methods
  
  private func setAppearanceAndSetupParticles() {
    // Hide the view as long as it's not in use
    isHidden = true
    // Disable user interaction, so that one can still interact with the background
    isUserInteractionEnabled = false
    // Make it transparent
    backgroundColor = nil
    // Instantiate a particle emmitter from Core Animation and set it up on the top of the view
    particleEmitter = CAEmitterLayer()
    particleEmitter.emitterPosition = CGPoint(x: frame.size.width / 2, y: 0)
    particleEmitter.emitterShape = CAEmitterLayerEmitterShape.line
    particleEmitter.emitterSize = CGSize(width: frame.size.width, height: 1)
    particleEmitter.birthRate = 0
    // Define the color array
    let confettiColors = [UIColor(named: "Blue")?.cgColor, UIColor(named: "Green")?.cgColor, UIColor(named: "Red")?.cgColor, UIColor(named: "Yellow")?.cgColor, UIColor(named: "Orange")?.cgColor]
    // Populate an array with particles of different color
    var confettiParticles = [CAEmitterCell]()
    for confettiColor in confettiColors {
      // Create a new Particle
      let confettiParticle = CAEmitterCell()
      // Play with the presets -> TODO
      confettiParticle.birthRate = 3
      confettiParticle.lifetime = 7
      confettiParticle.lifetimeRange = 0
      confettiParticle.color = confettiColor
      confettiParticle.velocity = 175
      confettiParticle.velocityRange = 40
      confettiParticle.emissionLongitude = CGFloat(Double.pi)
      confettiParticle.emissionRange = CGFloat(Double.pi)
      confettiParticle.spin = 2
      confettiParticle.spinRange = 3
      confettiParticle.scaleRange = 0.5
      confettiParticle.scaleSpeed = -0.05
      confettiParticle.contents = UIImage(named: "Confetti")?.cgImage
      confettiParticles.append(confettiParticle)
    }
    // Set the emmitter's particle type
    particleEmitter.emitterCells = confettiParticles
    // Add to this views layer
    layer.addSublayer(particleEmitter)
  }
  
}
