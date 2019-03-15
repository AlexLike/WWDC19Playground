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
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer {
  
  // MARK: - Properties
  
  // Outlets
  @IBOutlet weak var cardView: CardView!
  @IBOutlet weak var profileImageView: ProfileImageView!
  @IBOutlet weak var birthdateActionView: ActionView!
  @IBOutlet weak var emojiActionView: ActionView!
  @IBOutlet weak var phoneActionView: ActionView!
  @IBOutlet weak var mapsActionView: ActionView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var passionLabel: UILabel!
  @IBOutlet weak var occupationLabel: UILabel!
  @IBOutlet weak var meetLabel: UILabel!
  @IBOutlet weak var voiceOverButton: BottomButton!
  @IBOutlet weak var ARButton: BottomButton!
  
  
  // MARK: - PlaygroundSupport methods
  
  /*
   public func liveViewMessageConnectionOpened() {
   // Implement this method to be notified when the live view message connection is opened.
   // The connection will be opened when the process running Contents.swift starts running and listening for messages.
   }
   */
  
  /*
   public func liveViewMessageConnectionClosed() {
   // Implement this method to be notified when the live view message connection is closed.
   // The connection will be closed when the process running Contents.swift exits and is no longer listening for messages.
   // This happens when the user's code naturally finishes running, if the user presses Stop, or if there is a crash.
   }
   */
  
  public func receive(_ message: PlaygroundValue) {
    // Implement this method to receive messages sent from the process running Contents.swift.
    // This method is *required* by the PlaygroundLiveViewMessageHandler protocol.
    // Use this method to decode any messages sent as PlaygroundValue values and respond accordingly.
  }
  
  
  // MARK: - Actions
  
  
}
