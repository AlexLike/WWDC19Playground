//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Welcome!
 In this Swift Playground, we'll create a *super fancy, highly customizable and interactive* **personal card** with a ton of crazy and fun interactions and easter eggs.
 ## What's a personal card?
 Well, in day-to-day life, most people carry their **business card** around, yet there's no real equivalant to it for personal purposes and definitely no digital one. *Your* **personal card** should
 - highlight your interests,
 - reflect your personality and
 - be fun.
 ## The basics
 Since your card is built on top of Apple's UIKit framework, we'll have to import it first:
 */
import UIKit
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 As you can see, your card is drawn in a live view, which means that you can interact with it at any point in time.
 To add your basic information and customize its properties, edit the code below:
 */
// Instantiate a CardInformation struct that holds your information and provide your basic information as arguments
let cardInformation = CardInformation(
  name: /*#-editable-code your name, e.g. Craig*/""/*#-end-editable-code*/,
  passionEmojis: /*#-editable-code your passions, e.g. 💻📸🎾*/""/*#-end-editable-code*/,
  occupation: /*#-editable-code your occupation, e.g. working @ Apple*/""/*#-end-editable-code*/
)
//: When you're ready, hit "Run My Code" to see the result.
//#-hidden-code
if !cardInformation.name.isEmpty && !cardInformation.passionEmojis.isEmpty && !cardInformation.occupation.isEmpty {
  Book_Sources.sendValue(cardInformation)
  PlaygroundPage.current.assessmentStatus = .pass(message: "### You did it! \nAs you can see, your information was transferred seamlessly to the live view. Let's continue with some more advanced stuff on the [**next page**](@next)")
} else {
  PlaygroundPage.current.assessmentStatus = .fail(hints: ["Fill out every block to continue!"], solution: nil)
}
//#-end-hidden-code
