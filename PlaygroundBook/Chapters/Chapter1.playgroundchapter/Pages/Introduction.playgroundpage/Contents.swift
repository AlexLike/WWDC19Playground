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
 In this Swift Playground, we'll create a *super fancy, highly customizable and interactive* **personal card** with a bunch of crazy and fun interactions and easter eggs.
 ## What's a personal card?
 Well, in day-to-day life, most people carry their **business card** around, yet there's no real equivalant to it for personal purposes and definitely no digital one. *Your* **personal card** should be able to
 - reflect your interests,
 - personality and
 - convey some sort of fun to the viewer.
 ## The basics
 Since your card is built on top of Apple's UIKit framework, we'll have to import it first:
 */
import UIKit
//#-hidden-code
import PlaygroundSupport
//#-end-hidden-code
/*:
 As you can see, your card is drawn in a live view, which means that you can interact with it at any point in time.
 To add your basic information and customize some values of it, edit the code below:
 */
// Instantiate a CardInformation struct that holds your information and provide your basic information as arguments
let cardInformation = CardInformation(
  name: /*#-editable-code your name, e.g. Craig*/""/*#-end-editable-code*/,
  passionEmojis: /*#-editable-code your passions, e.g. 💻📸🎾*/""/*#-end-editable-code*/,
  occupation: /*#-editable-code your occupation, e.g. working @ Apple*/""/*#-end-editable-code*/
)
/*:
 When you're ready, hit Run my Code to see the result.
 */
//#-hidden-code
Book_Sources.sendValue(cardInformation)
//#-end-hidden-code
