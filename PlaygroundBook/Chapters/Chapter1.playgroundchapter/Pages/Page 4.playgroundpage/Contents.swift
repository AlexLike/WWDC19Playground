//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Je ne parle pas français
 In our globalized world, speaking as many languages as possible opens doors to a world of opportunities. Let's add the languages you master to your personal card. Choose from the most popular `Language`s on earth:
 - `.englishUS`
 - `.englishGB`
 - `.englishAU`
 - `.german`
 - `.french`
 - `.italian`
 - `.spanish`
 - `.portuguese`
 - `.russian`
 - `.mandarinChinese`
 - `.japanese`
 - `.hindi`
 - `.arabic`
 - `.malay`
 - `.bengali`
 - `.vietnamese`
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
// Instantiate an array with your spoken languages in the full notation (Language.yourLanguage)
let myLanguages: [Language] = [
  //#-code-completion(everything, hide)
  //#-code-completion(description, show, "Language")
  //#-editable-code your languages, e.g. .englishUS, .french
  //#-end-editable-code
]
// Add the language ActionView and provide it with your language array
//#-hidden-code
if
//#-end-hidden-code
addLanguagesActionView(forLanguages: myLanguages)
//: When you're ready, hit "Run My Code" to see the result.
//#-hidden-code
{
  PlaygroundPage.current.assessmentStatus = .pass(message: "### You rock! \nTap on your newly created language `ActionView` to see what happens! When you've done that, lets continue to the [**next page**](@next)")
} else {
  PlaygroundPage.current.assessmentStatus = .fail(hints: ["Make sure that you've used the correct form of writing and only languages listed above. Also, provide at least one language, since you know at least English if you're able to read this."], solution: nil)
}
//#-end-hidden-code
