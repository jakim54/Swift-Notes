//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// =============================== Constants and Variables

// =============================== Declaring Constants and Variables

// constant - immutable
let maximumNumberOfLoginAttempts = 10
// variable - mutable
var currentLoginAttempt = 0

// if a stored value isn't going to change, declare it as a constant always.

// multiple constants or variables can be declared on a single line
var x = 0.0, y = 0.0, z = 0.0

// =============================== Type Annotations

// an empty variable explicitly typed as string
// empty declared variables and constants must have their type explicit
var welcomeMessage: String
let welcomeGreeting: String

// multiple declaration with explicit type
var red, green, blue: Double
var red1: String, green1: Int, blue1: Float

// type inference in swift allows one to store without explicit type depending on the stored dat
var number = 12 // Int
let message = "Yarp" // String

// =============================== Naming Constants and Variables

// Any characters can be used to name them save for whitespace characters, mathematical symbols, arrows, private-use/invalid unicode points, or line and box drawing characters. Cannot start with a number, but can be included within.
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// Can't be redeclared, but the stored value can be changed, except for constants.
var friendlyWelcome = "Hello"
friendlyWelcome = "Bonjour"
print(friendlyWelcome) // prints Bonjour

// =============================== Printing Constants and Variables

//print(_:separator:terminator)
print(n, terminator: "") // next line is "terminated," with the next printed line being together with no space
print("Hello")
print("Terminator", terminator: " ") // same as before, except now there is space between Terminator and Hello, albiet in the same line
print("Hello")

// =============================== Comments

// This is a single line comment

/* This is a multi line comment
 see? */

/* This is the start of the first multi line comment.
 /* This is the second, nested multi line comment.
 This is the end of the first multi line comment. */
 This is the end of the second, nested multi line comment */

// =============================== Semicolons

// No need for semi colons, however they are required for multiple statements on a single line
let cat = "Cat"; print(cat) // Prints "Cat"

// =============================== Integers

/*
 Signed and unsigned integers in 8, 16, 32, and 64 bit forms.
 UInt for Unsigned Int like UInt8, Int for signed Int like Int32
 */

// Integer Bounds
let minValue = UInt8.min // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max // maxValue is equal to 255, and is of type UInt8

// Literal value is a value that appears directly in your source code, such as 42, 3.14159

// Inferred to be of type Int
let meaningOfLife = 42

// Swift defaults Double over Floats
let pi = 3.14159

// Underscore can be used to denote value as well as periods
let paddedDouble = 000123.456
let oneMillion = 1_000_000

// =============================== Numeric Type Conversion

/*
 Wrapping values with capitalize type will convert the literal's type, for the most part.
 String(3) // "3" instead of 3
 Double(2) // 2 is now a double instead of a Int
 */

// =============================== Type Alias

// Type aliases define an alternative name for an existing type. Useful when you want to refer to an existing type by a name that is contextually more appropriate, like working with data of a specific size from an external source
typealias AudioSample = UInt16

// Once defined, the alias can be used anywhere
var maxAmplitudeFound = AudioSample.min // becomes 0 due to .min

// =============================== Booleans
let orangesAreOrange = true
let iCanHazHamburgers = false

if orangesAreOrange {
    print("True")
} else {
    print("They are not")
}

/*
let i = 1
 
if i {
    print("Yes")
}
 
 // throws an error because i is not bool
 // Swift is trying to read it as if i is true/false
 // correct way below
*/

let i = 1

if i == 1 {
    print("This is the correct way, to compare the data in question")
} else {
    print("Try Again")
}

// =============================== Tuples

let http404Error = (404, "Page Not Found")
// tuple of Int and String

let (statusCode, statusMessage) = http404Error
print("These two values below comes from http404Error")
print("The status code is \(statusCode)")
print("The status code is \(statusMessage)")

// different ways to access tuple values
print("The status code is \(http404Error.0)") // print 404, 0 being the first index
print("The status message is \(http404Error.1)") // print Page Not Found, 1 being the second index

let http200Status = (statusCode: 200, description: "OK")
// parameters used to acess the values
print("The status code is \(http200Status.statusCode)")
print("The status code is \(http200Status.description)")

// =============================== Optionals
// Use optionals in situations where a value may be absent, either there is or isnt a value. You can unwrap to get the stored value or a nil.

// Contains a 404, question mark denotes that it's an optional
var serverResponseCode: Int? = 404

// explicitly nil
serverResponseCode = nil

// empty declared variable that is optional is automatically set to nil
var surveyAnswer: String?

// If statements to Implicitly Unwrap Optionals
var convertedNumber = String(2)
if convertedNumber != nil {
    print("convertedNumber contains some String value")
} // prints "convertedNumber contains some String value"

surveyAnswer = "Yarp"

// force unwrapping optionals, which is dangerous and must be done only when absolutely sure
print(surveyAnswer!)

// =============================== Optional Binding

// Use optional binding to find out whether an optional contains a value, and if so, make it available as a temporary constant or a variable and act on it.

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}

// Prints ""123" has an integer value of 123”

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// Prints "4 < 42 < 100”

/*
 Constants and variables created with optional binding in an if statement are available only within the body of the if statement. In contrast, the constants and variables created with a guard statement are available in the lines of code that follow the guard statement 
 */

// page 44









