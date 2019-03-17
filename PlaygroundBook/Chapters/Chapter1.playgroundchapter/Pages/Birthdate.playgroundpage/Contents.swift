//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code
/*:
 # Is it party time?
 Let's add your first interactive element to your card: your birthdate!
 Swift uses the `Date` type to capture points in time. To covert our human-readable birthdate to Swift's date, we have to use a `DateFormatter` object:
 */
//#-hidden-code
import UIKit
import PlaygroundSupport
//#-end-hidden-code
// Instantiate a DateFormatter
let dateFormatter = DateFormatter()
// Set the locale to the one you'd like to use
dateFormatter.locale = Locale(identifier: /*#-editable-code*/"en_US"/*#-end-editable-code*/)
// Set the date format of your input
dateFormatter.setLocalizedDateFormatFromTemplate(/*#-editable-code*/"MM/dd/yyyy"/*#-end-editable-code*/)
// Input your birthdate in the selected format
let birthdate = dateFormatter.date(from: /*#-editable-code your birthdate, e.g. 12/03/2001*/""/*#-end-editable-code*/)
// Add the birthdate ActionView with your date object
addBirthdateActionView(withDate: birthdate)
