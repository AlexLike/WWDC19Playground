//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import PlaygroundSupport

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer, UIGestureRecognizerDelegate {
  
  // MARK: - Properties
  
  // Outlets
  @IBOutlet weak var cardView: CardView!
  @IBOutlet weak var contentStackView: UIStackView!
  @IBOutlet weak var profileImageView: ProfileImageView!
  @IBOutlet weak var birthdateActionView: ActionView!
  @IBOutlet weak var emojiActionView: ActionView!
  @IBOutlet weak var phoneActionView: ActionView!
  @IBOutlet weak var languageActionView: ActionView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var passionLabel: UILabel!
  @IBOutlet weak var occupationLabel: UILabel!
  @IBOutlet weak var meetLabel: UILabel!
  @IBOutlet weak var voiceOverButton: BottomButton!
  @IBOutlet weak var ARButton: BottomButton!
  
  // Animator objects
  private var cardAnimator: UIDynamicAnimator!
  private var cardSnapBehaviour: UISnapBehavior!
  
  
  // MARK: - Controller lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    // Hide all ActionViews, as they're only unlocked at a later point in time
    birthdateActionView.isHidden = true
    emojiActionView.isHidden = true
    phoneActionView.isHidden = true
    languageActionView.isHidden = true
    // Hide all BottomButtons, as they're only unlocked at a later point in time
    voiceOverButton.isHidden = true
    ARButton.isHidden = true
    // Restore data from previous pages
    restoreFromPersistance()
  }
  
  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupCardAnimator()
  }

  
  
  // MARK: - PlaygroundSupport methods

  // Interpret received messages
  public func receive(_ message: PlaygroundValue) {
    // Check whether the received message is a dictionary of type <String: PlaygroundValue>
    if case .dictionary(let dictionary) = message {
      // Go over all the element's keys
      for key in dictionary.keys {
        // Switch every element's key for the known one's
        switch key {
        case "name":
          // Extract the String value and update nameLabel
          guard case .string(let name)? = dictionary[key] else { return }
          nameLabel.text = "Hello! I'm \(name)."
          // Persist data
          PlaygroundKeyValueStore.current["name"] = dictionary[key]
        case "passionEmojis":
          // Extract the String value and update passionLabel
          guard case .string(let passionEmojis)? = dictionary[key] else { return }
          passionLabel.text = "Although I'm interested in almost everything, I really love \(passionEmojis)"
          // Persist data
          PlaygroundKeyValueStore.current["passionEmojis"] = dictionary[key]
        case "occupation":
          // Extract the String value and update passionLabel
          guard case .string(let occupation)? = dictionary[key] else { return }
          occupationLabel.text = "I'm currently \(occupation)"
          // Persist data
          PlaygroundKeyValueStore.current["occupation"] = dictionary[key]
        default:
          return
        }
      }
    }
    // Check whether the received message is a date
    if case .date(let birthdate) = message {
      birthdateActionView.isHidden = false
      // Update the birthdate actionview
    }
  }
  
  // Load data from persistant storage
  private func restoreFromPersistance() {
    let store = PlaygroundKeyValueStore.current
    if case .string(let name)? = store["name"] { nameLabel.text = "Hello! I'm \(name)." }
    if case .string(let passionEmojis)? = store["passionEmojis"] { passionLabel.text = "Although I'm interested in almost everything, I really love \(passionEmojis)" }
    if case .string(let occupation)? = store["occupation"] { occupationLabel.text = "I'm currently \(occupation)" }
  }
  
  
  
  // MARK: - Actions
  
  // Read it out button pressed
  @IBAction func readItOut(_ sender: BottomButton) {
    print("Now, I'll read it out!")
  }
  
  // View in AR button pressed
  @IBAction func viewInAR(_ sender: BottomButton) {
    print("Now, I'll open AR mode.")
  }
  
  // Birthday action view pressed
  @IBAction func openBirthdatePrompt(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll open the birthdate prompt.")
  }
  
  // Emoji action view pressed
  @IBAction func simulateConfetti(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll simulate confetti.")
    // Instantiate a ConfettiOverlayView and start the confetti
    let confettiOverlayView = ConfettiOverlayView(frame: view.frame)
    view.addSubview(confettiOverlayView)
    confettiOverlayView.startConfetti()
    // Schedule stopConfetti() in 5 seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
      confettiOverlayView.stopConfetti()
    }
    // Schedule the overlay view's removal in 15 seconds
    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
      confettiOverlayView.removeFromSuperview()
    }
  }
  
  // Phone action view pressed
  @IBAction func mockCallAndJoke(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll mock a call.")
  }
  
  // Maps action view pressed
  @IBAction func openLanguagePrompt(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll open the language prompt.")
  }
  
  // Card view panned
  @IBAction func panCardView(_ recognizer: UIPanGestureRecognizer) {
    // Check whether UIPanGestureRecognizer's state has changed
    switch recognizer.state {
    case .began:
      // Remove the snap behaviour so that the item can move easily
      cardAnimator.removeBehavior(cardSnapBehaviour)
    case .changed:
      // Get the change in position
      let deltaPos = recognizer.translation(in: view)
      // Adjust card view's position
      cardView.center = CGPoint(
        x: cardView.center.x + deltaPos.x,
        y: cardView.center.y + deltaPos.y
      )
      // Check whether card view overlaps the left edge of view
      if !view.frame.contains(view.convert(cardView.frame.origin, from: contentStackView)) {
        print("CardView overlaps the left edge of view")
      } else if !view.frame.contains(view.convert(CGPoint(x: cardView.frame.maxX, y: 0), from: contentStackView)) {
        print("CardView overlaps the right edge of view")
      }
      // Flush the recognizer
      recognizer.setTranslation(.zero, in: view)
    case .ended, .cancelled, .failed:
      // Add the snap behaviour so that the item snaps back into place
      cardAnimator.addBehavior(cardSnapBehaviour)
    default:
      return
    }
  }
  
  
  // MARK: - Private methods
  
  private func setupCardAnimator() {
    // Instantiate the animator object with live view as
    cardAnimator = UIDynamicAnimator(referenceView: view)
    // Configure the snap behaviour
    let cardViewCenterOnView = cardView.convert(cardView.center, to: view)
    cardSnapBehaviour = UISnapBehavior(item: cardView, snapTo: CGPoint(x: view.center.x, y: cardViewCenterOnView.y))
  }
  
}
