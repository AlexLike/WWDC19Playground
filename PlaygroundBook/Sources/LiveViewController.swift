//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  An auxiliary source file which is part of the book-level auxiliary sources.
//  Provides the implementation of the "always-on" live view.
//

import UIKit
import AVFoundation
import PlaygroundSupport

@objc(Book_Sources_LiveViewController)
public class LiveViewController: UIViewController, PlaygroundLiveViewMessageHandler, PlaygroundLiveViewSafeAreaContainer, UIGestureRecognizerDelegate {
  
  // MARK: - Properties
  
  // Outlets
  @IBOutlet weak var cardView: CardView!
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var profileImageView: ProfileImageView!
  @IBOutlet weak var birthdateActionView: ActionView!
  @IBOutlet weak var birthdateMonthLabel: UILabel!
  @IBOutlet weak var birthdateDayLabel: UILabel!
  @IBOutlet weak var emojiActionView: ActionView!
  @IBOutlet weak var emojiLabel: UILabel!
  @IBOutlet weak var phoneActionView: ActionView!
  @IBOutlet weak var languageActionView: ActionView!
  @IBOutlet weak var languageFlagLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var passionLabel: UILabel!
  @IBOutlet weak var occupationLabel: UILabel!
  @IBOutlet weak var meetLabel: UILabel!
  @IBOutlet weak var voiceOverButton: BottomButton!
  @IBOutlet weak var ARButton: BottomButton!
  @IBOutlet weak var unsupportedView: UIVisualEffectView!
  
  // Animator objects
  private var cardAnimator: UIDynamicAnimator!
  private var cardSnapBehaviour: UISnapBehavior!
  
  // User-input
  private var birthdate: Date?
  private var languages: [Language]?
  private var isAlexCardShown: Bool = false
  
  // AVPlayers
  private var audioPlayer = AVQueuePlayer()
  
  
  // MARK: - Controller lifecycle
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    // Hide all labels, since they're only unlocked at a later point in time
    nameLabel.isHidden = true
    passionLabel.isHidden = true
    occupationLabel.isHidden = true
    meetLabel.isHidden = true
    // Hide the image view, since it's only unlocked at a later point in time
    profileImageView.isHidden = true
    // Hide all ActionViews, since they're only unlocked at a later point in time
    birthdateActionView.isHidden = true
    emojiActionView.isHidden = true
    phoneActionView.isHidden = true
    languageActionView.isHidden = true
    // Hide all BottomButtons, since they're only unlocked at a later point in time
    voiceOverButton.isHidden = true
    ARButton.isHidden = true
    // Restore data from previous pages
    restoreFromPersistance()
  }
  
  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    setupCardAnimator()
    displayUnsupportedIfNeeded()
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
          // Persist data
          PlaygroundKeyValueStore.current["name"] = dictionary[key]
        case "passionEmojis":
          // Persist data
          PlaygroundKeyValueStore.current["passionEmojis"] = dictionary[key]
        case "occupation":
          // Persist data
          PlaygroundKeyValueStore.current["occupation"] = dictionary[key]
        case "displayPhone":
          // Persist data
          PlaygroundKeyValueStore.current["displayPhone"] = dictionary[key]
        case "displayVoiceOver":
          // Persist data
          PlaygroundKeyValueStore.current["displayVoiceOver"] = dictionary[key]
        case "displayARKit":
          // Persist data
          PlaygroundKeyValueStore.current["displayARKit"] = dictionary[key]
        case "loadAlexCard":
          // Load my data
          displayAlexCard()
          // Save state
          isAlexCardShown = true
          return
        default:
          return
        }
      }
    }
      // Check whether the received message is a date
    else if case .date(_) = message {
      // Persist data
      PlaygroundKeyValueStore.current["birthdate"] = message
    }
    else if case .string(_) = message {
      // Persist data
      PlaygroundKeyValueStore.current["emoji"] = message
    }
    else if case .array(_) = message {
      // Persist data
      PlaygroundKeyValueStore.current["languageArray"] = message
    }
    else if case .data(_) = message {
      // Persist data
      PlaygroundKeyValueStore.current["profileImage"] = message
    }
    else if case .integer(_) = message {
      // Persist data
      PlaygroundKeyValueStore.current["gradient"] = message
    }
    // Display data
    restoreFromPersistance()
  }
  
  // Load data from persistant storage and display it
  private func restoreFromPersistance() {
    let store = PlaygroundKeyValueStore.current
    if case .string(let name)? = store["name"] {
      nameLabel.text = "Hello! I'm \(name)."
      // Show all labels
      nameLabel.isHidden = false
      passionLabel.isHidden = false
      occupationLabel.isHidden = false
      meetLabel.isHidden = false
      // Show the image view
      profileImageView.isHidden = false
    }
    if case .string(let passionEmojis)? = store["passionEmojis"] { passionLabel.text = "Although I'm interested in almost everything, I really love \(passionEmojis)" }
    if case .string(let occupation)? = store["occupation"] { occupationLabel.text = "I'm currently \(occupation)" }
    if case .date(let birthdate)? = store["birthdate"] {
      // Save to properties
      self.birthdate = birthdate
      // Update date labels
      updateBirthdateLabelling(date: birthdate)
      // Show birthdate ActionView
      birthdateActionView.isHidden = false
    }
    if case .string(let emoji)? = store["emoji"] {
      // Update emoji label
      emojiLabel.text = emoji
      // Show emoji ActionView
      emojiActionView.isHidden = false
    }
    if case .boolean(let displayPhone)? = store["displayPhone"] {
      guard displayPhone else { return }
      // Show phone ActionView
      phoneActionView.isHidden = false
    }
    if case .array(let languageArray)? = store["languageArray"] {
      // Empty the language property
      languages = [Language]()
      // Update language label
      updateLanguageLabelling(languageArray: languageArray)
      // Show language ActionView
      languageActionView.isHidden = false
    }
    if case .data(let profileImagePNGdata)? = store["profileImage"] {
      // Create an UIImage for the PNG-encoded data
      let profileImage = UIImage(data: profileImagePNGdata)
      // Update image view
      profileImageView.image = profileImage
    }
    if case .integer(let gradientRawValue)? = store["gradient"] {
      // Convert back to Gradient type
      let gradient = Gradient(rawValue: gradientRawValue) ?? Gradient.deepBlue
      // Get the color array
      let cgColorArray = cgColorArrayForGradient(gradient)
      // Update card view
      guard let cardViewGradientLayer = cardView.layer as? CAGradientLayer else { return }
      cardViewGradientLayer.colors = cgColorArray
    }
    if case .boolean(let displayVoiceOver)? = store["displayVoiceOver"] {
      guard displayVoiceOver else { return }
      // Show VoiceOver button
      voiceOverButton.isHidden = false
    }
    if case .boolean(let displayARKit)? = store["displayARKit"] {
      guard displayARKit else { return }
      // Show AR button
      ARButton.isHidden = false
    }
  }
  
  
  
  // MARK: - Actions
  
  // Read it out button pressed
  @IBAction func readItOut(_ sender: BottomButton) {
    print("Now, I'll read it out!")
    // Get the birthdate as a String
    var birthdateString: String {
      // Instantiate a DateFormatter
      let dateFormatter = DateFormatter()
      // Set the locale
      dateFormatter.locale = Locale(identifier: "en_US")
      // Set the date format
      dateFormatter.dateStyle = .long
      // Input your birthdate in the selected format
      return dateFormatter.string(from: birthdate ?? Date())
    }
    // Get the spoken languages as a String
    guard let languages = languages else { return }
    var languageString = String()
    for language in languages {
      languageString.append("\(language.rawValue), ")
    }
    // Assemble cardText
    let cardText = "You're currently viewing a digital, personal card. \n\(nameLabel.text!) \n\(passionLabel.text!). \n\(occupationLabel.text!). \nMy birthdate is \(birthdateString) and I master the following languages: \(languageString). My favorite emoji is \(emojiLabel.text!). \n\(meetLabel.text!)"
    // Synthesize speech
    let speechSynthesizer = AVSpeechSynthesizer()
    let speechUtterance = AVSpeechUtterance(string: cardText)
    speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    speechUtterance.pitchMultiplier = 1.3
    speechSynthesizer.speak(speechUtterance)
  }
  
  // View in AR button pressed
  @IBAction func viewInAR(_ sender: BottomButton) {
    print("Now, I'll open AR mode.")
  }
  
  // Birthday action view pressed
  @IBAction func openBirthdatePrompt(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll open the birthdate prompt.")
    // Get the current calendar
    let calendar = Calendar.current
    // Get now as a date
    let now = Date()
    // Replace its time with 0:00 for preciseness
    let today = calendar.startOfDay(for: now)
    // Get this year's birthday
    var birthdateComponents = calendar.dateComponents([.month, .day], from: birthdate!)
    birthdateComponents.year = calendar.component(.year, from: today)
    var birthdayThisYear = calendar.date(from: birthdateComponents) ?? Date()
    // Choose next year's birthday if it already happened this year
    if birthdayThisYear < today {
      birthdateComponents.year = calendar.component(.year, from: today) + 1
      birthdayThisYear = calendar.date(from: birthdateComponents) ?? Date()
    }
    // Compute the days inbetween
    let daysInbetween = calendar.dateComponents([.day], from: today, to: birthdayThisYear).day ?? 0
    // Instantiate the alert controller and set up its text
    let alert = UIAlertController(
      title: "Only \(daysInbetween) days to go!",
      message: "I can't wait to celebrate with everyone. We'll have a big barbecue, maybe some Animoji karaoke and one big pie, or how about multiple big pies? Yummy!",
      preferredStyle: .alert
    )
    // Add an OK action
    alert.addAction(UIAlertAction(
      title: "Yeah!",
      style: .default
    ))
    // Present the alert
    self.present(alert, animated: true, completion: nil)
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
    // Check whether my card is shown
    if isAlexCardShown {
      // Get the audio file's path
      guard let audioPath = Bundle.main.path(forResource: "Alex Phone Call.m4a", ofType: nil) else { return }
      print("I have the audio path")
      audioPlayer.removeAllItems()
      audioPlayer.insert(AVPlayerItem(url: URL(fileURLWithPath: audioPath)), after: nil)
      audioPlayer.play()
    } else {
      // Synthesize a mock call text
      let mockCallText = "This call's recipient is currently unavailable. Please try again soon."
      let speechSynthesizer = AVSpeechSynthesizer()
      let speechUtterance = AVSpeechUtterance(string: mockCallText)
      speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
      speechUtterance.pitchMultiplier = 0.6
      speechSynthesizer.speak(speechUtterance)
    }
  }
  
  // Language action view pressed
  @IBAction func openLanguagePrompt(_ recognizer: UITapGestureRecognizer) {
    print("Now, I'll open the language prompt.")
    // Construct the alert's message
    var message = "I see you've discovered which languages I speak. Well, good for you, because you can now drop me a line saying "
    for language in languages ?? [] {
      let greeting = helloInLanguage(language)
      message.append(contentsOf: "\n \(greeting) ")
    }
    message.append(contentsOf: "\n to say Hi!")
    // Instantiate the alert controller and set up its text
    let alert = UIAlertController(
      title: "How to greet me",
      message: message,
      preferredStyle: .alert
    )
    // Add an OK action
    alert.addAction(UIAlertAction(
      title: "Thanks!",
      style: .default
    ))
    // Present the alert
    self.present(alert, animated: true, completion: nil)
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
      if isAlexCardShown {
        // Check whether card view overlaps the left edge of view
        if !view.frame.contains(view.convert(cardView.frame.origin, from: contentView)) {
          print("CardView overlaps the left edge of view")
          // Instantiate the alert controller and set up its text
          let alert = UIAlertController(
            title: "Wait, what?",
            message: "Do you really want to discard me? I'd be super sad. If I were you, I'd swipe to the right!",
            preferredStyle: .alert
          )
          // Add an OK action
          alert.addAction(UIAlertAction(
            title: "Okay, I'm sorry",
            style: .default
          ))
          // Present the alert
          self.present(alert, animated: true, completion: nil)
        } else if !view.frame.contains(view.convert(CGPoint(x: cardView.frame.maxX, y: 0), from: contentView)) {
          print("CardView overlaps the right edge of view")
          // Instantiate the alert controller and set up its text
          let alert = UIAlertController(
            title: "It's a match!",
            message: "Yeah! Alex liked you too. It's time for you to meet somewhere in California. At a conference. This June. Hopefully.",
            preferredStyle: .alert
          )
          // Add an OK action
          alert.addAction(UIAlertAction(
            title: "See you at WWDC19",
            style: .default
          ))
          // Present the alert
          self.present(alert, animated: true, completion: nil)
        }
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
    cardSnapBehaviour = UISnapBehavior(item: cardView, snapTo: contentView.center)
  }
  
  private func displayUnsupportedIfNeeded() {
    // Check view size
    if view.bounds.size.height < 600 {
      // Show unsupported view
      unsupportedView.isHidden = false
    } else {
      // Hide unsupported view
      unsupportedView.isHidden = true
    }
  }
  
  private func updateBirthdateLabelling(date: Date) {
    // Instantiate and configure a DateFormatter
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    // Format month
    dateFormatter.setLocalizedDateFormatFromTemplate("MMM")
    birthdateMonthLabel.text = dateFormatter.string(from: date)
    // Format day
    dateFormatter.setLocalizedDateFormatFromTemplate("d")
    birthdateDayLabel.text = dateFormatter.string(from: date)
  }
  
  private func updateLanguageLabelling(languageArray: [PlaygroundValue]) {
    // Instantiate a flag collection string
    var languageFlags = String()
    // Go over each playground value
    for languagePlaygroundValue in languageArray {
      // Convert it to a raw string value
      guard case .string(let languageString) = languagePlaygroundValue else { return }
      // Cast to Language and store in properties
      guard let language = Language(rawValue: languageString) else { return }
      languages?.append(language)
      // Get the language's flag
      let flag = flagEmojiForLanguage(language)
      // Append the flag to the collection
      languageFlags.append(contentsOf: flag)
    }
    // Update flag label
    languageFlagLabel.text = languageFlags
  }
  
  private func displayAlexCard() {
    // Basic labels
    nameLabel.text = "Hello, I'm Alex."
    nameLabel.isHidden = false
    passionLabel.text = "Although I'm interested in almost everything, I really love 🕺👨‍💻🤳⛷🤝🎾"
    passionLabel.isHidden = false
    occupationLabel.text = "I'm currently studying for my Abitur (high school diploma)"
    occupationLabel.isHidden = false
    meetLabel.isHidden = false
    // Birthdate ActionView
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ddMMyyyy"
    birthdate = dateFormatter.date(from: "17072002")
    updateBirthdateLabelling(date: birthdate!)
    birthdateActionView.isHidden = false
    // Emoji ActionView
    emojiLabel.text = "🥳"
    emojiActionView.isHidden = false
    // Phone ActionView
    phoneActionView.isHidden = false
    // Language ActionView
    languages = [.englishUS, .german, .romanian, .french]
    languageFlagLabel.text = "🇺🇸🇩🇪🇷🇴🇫🇷"
    languageActionView.isHidden = false
    // Profile ImageView
    profileImageView.image = UIImage(named: "Alex")
    profileImageView.isHidden = false
    // CardView Gradient
    let cgColorArray = cgColorArrayForGradient(Gradient.bloodyMary)
    guard let cardViewGradientLayer = cardView.layer as? CAGradientLayer else { return }
    cardViewGradientLayer.colors = cgColorArray
    // BottomButtons
    voiceOverButton.isHidden = false
    ARButton.isHidden = false
  }
  
  
  // MARK: - Navigation
  
  public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get ARViewController object
    guard let ARViewController = segue.destination as? ARViewController else { return }
    // Capture an image of CardView
    UIGraphicsBeginImageContextWithOptions(cardView.frame.size, false, 3)
    guard let context = UIGraphicsGetCurrentContext() else { return }
    cardView.layer.render(in: context)
    guard let cardViewImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
    UIGraphicsEndImageContext()
    // Pass the image to ARViewController
    ARViewController.cardImage = cardViewImage
  }
  
  @IBAction func goBackToLiveViewController(_ segue: UIStoryboardSegue) {
    // IBAction for unwind segue, empty implementation
  }
  
}
