//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Let's get fancy
 It's now time for the finishing touches.
 ## Wait, that's you?
 Up until now, you were able to hide your gorgeous appearance behind an avatar. Well, now, let's add a real image in Swift's `UIImage` format:
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
// Instantiate an UIImage object with a picture of you (Tap the image litaral to select or snap one)
let profileImage: UIImage = /*#-editable-code your image*/#imageLiteral(resourceName: "Placeholder")/*#-end-editable-code*/
// Update the live view's ProfileImageView and provide it with your profileImage object
updateProfileImageView(withImage: profileImage)
/*:
 ## So many hues!
 Color is identity and tells a lot about what your brand, or in this case you yourself stand for. If you wish to, you can now customize your card's background. Under the hood, this is backed by a `CAGradientLayer`. Choose from one of the following `Gradient` color combinations:
 - `.orangeYellow`
 - `.pinkPurple`
 - `.deepBlue`
 - `.brightGreen`
 - `.bloodyMary`
 */
// Instantiate a Gradient object of your choice in short notation (.yourGradient)
let cardViewGradient: Gradient = /*#-editable-code your gradient, e.g. .deepBlue*/.orangeYellow/*#-end-editable-code*/
// Apply it to your CardView
updateCardViewLayer(toGradient: cardViewGradient)
//: When you're ready, hit "Run My Code" to see the result.
