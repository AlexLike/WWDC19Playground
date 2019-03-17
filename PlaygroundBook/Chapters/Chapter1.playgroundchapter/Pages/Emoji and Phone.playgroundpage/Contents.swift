//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # How about being more personal
 ## I really love that one
 It's time for another interactive element: your favorite emoji.
 Emojis are great, right? Everyone loves them. So let's specify your favorite one and see what happens:
 */
//#-hidden-code
import UIKit
import PlaygroundSupport

if
//#-end-hidden-code
addEmojiActionView(withEmoji: /*#-editable-code your favorite emoji, e.g. 🥳*/""/*#-end-editable-code*/)
/*:
 ## Call me (maybe)
 Why have a digital personal card if one can't call you using it? Let's add this function too:
 */
//#-hidden-code
&&
//#-end-hidden-code
addPhoneActionView()
//: When you're ready, hit "Run My Code" to see the result.
//#-hidden-code
{
  PlaygroundPage.current.assessmentStatus = .pass(message: "### Okay! \nTry to tap on your newly created emoji and phone `ActionView`s to see what happens! Under the hood, your personal card uses a `CAEmitterLayer` for animating the confetti. When you've done that, lets continue on the [**next Page**](@next)")
} else {
  PlaygroundPage.current.assessmentStatus = .fail(hints: ["Make sure that you only enter one favorite emoji."], solution: nil)
}
//#-end-hidden-code
