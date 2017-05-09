import UIKit

// Playground with examples from Apple's official Swift 3.1 Book.

// =============================
// Simple Value ================
// =============================

var str = "Hello, playground"
print(str) // mutable variable
print("\(str)") // string interpolation
print("Hello, playground") // string

var myVariable = 42 // declaration of variable with inferred type based on assigned value
var myVariable2: Int = 42 // declared variable with explicit type and value
myVariable = 59 // changing the value
print(myVariable) // prints 59

let implicitInteger = 70 // declaration of a constant with inferred type based on assigned value
// cannot change the type of a variable or a constant once inferred/created, only the value

// empty constant and variables must be declared with an explicit type with it being optional considered safe
// var emptyVariable: AnyObject?

// mixed use case of different types
// String(value) converts the value inside the parentheses into a String value
var label = "The width is "
let width = 94
let widthLabel = label + String(width)
print(widthLabel)

let apples = 3
let oranges: Float = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + Int(oranges)) pieces of fruits"
print(appleSummary, "\n" + fruitSummary)

// ===============================
// Array & Dictionary ============
// ===============================

// an array
// empty array must also have an explicit type
// var shoppingList = [String]()
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
print(shoppingList)
shoppingList[1] = "bottle of water" // replacing water, located at index position 1 with bottle of water
print(shoppingList) // the change is reflected

// A dictionary
// a key and value pair, separated by a colon
var occupations = ["Jayne" : "Human Resources", "Malcolm" : "Captain"]
print(occupations)

// var emptyDictionary = [String: Any]()
// declared an empty dictionary with explicit type for key, String, and the value as Any
// any given dictionary can have different types for both key and values as long as the type is explicitly stated when declared initally

// to add to any given dictionary simply follow this format: variable_name[key] = assignedValue
occupations["Kaylee"] = "Mechanic"
print(occupations) // prints occupations having added Kaylee

// from Apple: If type information can be inferred, both an empty array and a dictionary can be written as follows
// shoppingList = []
// occupations = [:]

// =============================
// Control Flow ================
// =============================

/*
 list of syntax:
 = if, else, else if
 = for, for-in, while, repeat-while
 */

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

// in an if statement, the conditional must be a Boolean expression, true or false, otherwise it won't do anything and throw an error
// each condition once met, will execute
// this for loop will continue for each object/number in individualScores
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print(teamScore) // prints 11

// Optionals

var optionalString: String? = "Hello" // an optional
print(optionalString == nil) // asked if optionalString was nil, which is false because it's assigned string "Hello"

var optionalName: String? = "Johnny Appleseed" // an optional
var greeting = "Hello!"
print(greeting)
if let name = optionalName {
    greeting = "Hello, \(name)"
}

print(greeting) // used if let to IUO into a variable and changed greeting's value with it interpolated

let nickName : String? = nil
let fullName: String = "Johnny Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
// ?? is used to to handle cases where if the initial, optional value is missing, then the default, the latter, will be executed
print(informalGreeting) // printed fullName because the initial, optional value nickName is nil

let vegetable = "Red Pepper"
// default must be specified and if not, the error will be thrown for the cases to be exhaustive
switch vegetable {
case "Celery":
    print("Add some raisins and make ants on a log.")
case "red pepper":
    print("Lower/upper case doesn't matter it seems.")
case "Cucumber", "Watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("Pepper"):
    // the way let was used to assign x with where x.hasSuffix("Pepper") is pattern matching, like if let for IUO
    print("Is \(x) a spicy pepper?")
default:
    print("Everything tastes good in a soup.")
}

// For-In

// to iterate over items in a dictionary, use the for-in loop
// dictionaries are an unordered collection, so their keys and values will be iterated over in an arbitray order

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
]

var largest = 0
for (kind, numbers) in interestingNumbers {
    // kind being key, numbers being the key's value in the constant interestingNumbers, this for-in loop accesses the dictionary's item
    for number in numbers {
        // this for-in loop now iterates over the array, for each number in that array, that was accessed by the initial for-in loop
        if number > largest {
            largest = number
        }
    }
}

print(largest) // prints 25

// Repeat/While

// use while to repeat a block of code until a condition changes. the condition of a loop can be at the end instead, ensuring that the loop is run at least once.

// this while loop ran until n was greater than 100
var n = 2
while n < 100 {
    n += 2
}

print(n) // prints 100

// this repeat-while loop ran until m was greater than 100
var m = 2
repeat {
    m += 2
} while m < 100
print(m) // prints 100

// You can keep an index in a loop by using ..< to make a range of indexes.

var total = 0
// this for in loop with the range ran the code for each index until it hit 3, since <4 means less than 4
// it ran a total of 4 times, counting 0
for i in 0..<4 {
    total += i
}

print(total) // prints 6

// =============================
// Functions && Closures =======
// =============================

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

var holdingGreet = greet(person: "Paul", day: "Wednesday")
print(holdingGreet)

print(greet(person: "Bob", day: "Tuesday"))
// put underscore before a parameter to have it be empty 
// func greet(_ person: String)
// greet("Bob")

// Use a tuple to make a compound value - for example, to return multiple values from function. the elements of a tuple can be referred to either by name or by number

func calculateStats(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

var arrayInsert = [5, 3, 100, 3, 9]
let statistics = calculateStats(scores: arrayInsert)
print(statistics.sum) // prints 120
// you can also refer to the parameters by number instead of its name/label, shown below
print(statistics.2) // prints 120

// this function takes a bunch of numbers into an array, but doesn't accept an actual array? look into this
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf(numbers: 42, 597, 12)
var printIt = sumOf(numbers: 42, 597, 12)
print(printIt) // prints 651

// Nested Functions

func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    
    add() // called once after being created above, so y should now equal 15.
    
    return y
}
 print(returnFifteen()) // prints 15. this function can also be nested in another function and so on.

// functions are a first-class type. a function can return another function as its value

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
print(increment(7)) // returns 8

// functions can take functions as its arguments

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
// hasAnyMatches(list: numbers, condition: lessThanTen(number:))
print(hasAnyMatches(list: numbers, condition: lessThanTen(number:))) // returns true

var thisShit = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// this example is sort of redundant, since for map you can do $0 * 3
// this closure example to show the access level between scopes
print(thisShit) // prints an array of [60, 57, 21, 36]

// When a closure's type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

// you can also refer to the parameters by number instead of its name/label with $, shown below
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


// =============================
// Objects && Classes ==========
// =============================

// declaration of classes are the same as methods and functions, with the exception of capitalization due to it being a class

class Shape {
    
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// instantiating a simple object of class Shape, without init
var shape = Shape()
// defining the instantiated object's, shape, numberOfSides variable
shape.numberOfSides = 7
// storing it in a variable to print it
var shapeDescription = shape.simpleDescription()
print(shapeDescription) // returns "A shape with 7 sides."
// checking the object's, within the variable shape, numberOfSides
print(shape.numberOfSides) // returns 7, so it's good.


// a more proper class defined, with init
class NamedShape {
    
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
// instantiated an instance object of the class
var namedShape = NamedShape(name: "Hexagon")

// defining the instantiated objects numberOfSides
namedShape.numberOfSides = 6
//print(namedShape.simpleDescription())
var toPrint = namedShape.name + ": " + namedShape.simpleDescription()
print(toPrint)

/*
 Self is used to distinguish the name property from the name argument for init. the arguments to the initializer are passed like a function call when you create an instance of the class. every property needs a value assigned, either in its declaration like numberOfSides, and/or within the initializer like name
 
 deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated
 
 subclasses include their superclass name after their class name, separated by a colon. there is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
 
 methods on a subclass that override the superclass's implementation are marked with override. this overriden function is specific to the subclass and its instance objects only, not being accessible by the superclasses and its instances.
 */

// NamedShape is the superclass/root, with Square being the subclass
class Square: NamedShape {
    
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        // init of the super class called here
        super.init(name: name)
        // numberOfSides from the super class defined here
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // overriden func from the super, changed the return values.
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let instantiatedSquare = Square(sideLength: 5.2, name: "Test Square")
// stored in vars to reduce typing out the full shit
var areaOfSides = instantiatedSquare.area()
var description = instantiatedSquare.simpleDescription()

print("This is the name: \(instantiatedSquare.name), the sideLength: \(instantiatedSquare.sideLength) the area of sides: \(areaOfSides), and its description: \(description)")

// TODO: create a subclass called circle, with radius and name for init args
class Circle: NamedShape {
    
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return Double.pi * (radius * radius)
    }
    
    override func simpleDescription() -> String {
        return "A circle with an area of "
    }
}

let instantiatedCircle = Circle(radius: 20, name: "Test Cicle")
print(instantiatedCircle.simpleDescription() + String(instantiatedCircle.area()))

// Getter And Setter On Properties

class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "Test Triangle")
print(triangle.perimeter) // sideLength was specified, so it gets the perimeter, triggering the get function
triangle.perimeter = 9.9 // when a perimeter is set, then the set function triggers, new value being the initial value set here, which is 9.9
print(triangle.sideLength) // prints 3.3
// avlues that doesn't need to compute the property, but still need to provide code that is run before and after setting a new value, use willSet and didSet. The provided code is run any time the value changes outside of an initializer. The class below ensures that the side length of its triangle is always the same as the side length of its square.

class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "Test Triangle & Square")
// size sets the sideLength for both as default with specificity
print(triangleAndSquare.square.sideLength) // prints 10
print(triangleAndSquare.triangle.sideLength) // prints 10
triangleAndSquare.square = Square(sideLength: 50, name: "Test Larger Square") // set sideLength to 50 for square
print(triangleAndSquare.triangle.sideLength) // prints 50
print(triangleAndSquare.square.sideLength) // prints 50

let optionalSquare: Square? = Square(sideLength: 2.5, name: "Test Optional Square")
let sideLength = optionalSquare?.sideLength
print(sideLength!) // prints 2.5, but also throws an fix-it suggestion

// Enumerations And Structures

enum Rank: Int {
    
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

// rawValues are assigned 0 and increments in 1's by default
// case two to king follows the progression by inference

let ace = Rank.ace
let aceRawValue = ace.rawValue
let two = Rank.two
let twoRawValue = two.rawValue
let king = Rank.king
let kingRawValue = king.rawValue

// TODO: Write a function that compares two Rank values by comparing their raw values.

func firstIsGreaterThan(firstRank: Rank, secondRank: Rank) -> Bool {
    let firstRV = firstRank.rawValue
    let secondRV = secondRank.rawValue
    
    return firstRV > secondRV ? true : false
}

firstIsGreaterThan(firstRank: ace, secondRank: two)

// would have returned nil if there was no case matching the rawValue, but it does and returns 3
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    // TODO: Add a color() method to Suit that returns "black" for spades and clubs, and returns "red" for hearts and diamonds
    func color() -> String {
        
        switch self {
        case .spades:
            return "black"
        case .hearts:
            return "red"
        case .diamonds:
            return "red"
        case .clubs:
            return "black"
        }
    }
} // end of enum Suit

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let testSuite = Suit.clubs.color() // returns black
let testSuite1 = Suit.hearts.color()

// Associated Values Behaving Like Stored Properties Of The Enumeration Case Instance

// functions for cases in enums. Interesting.
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case redirect(Int)
}

// change the switch condition from success to any of the three below to see the printout
let success = ServerResponse.result("6:00 AM", "8:09 PM")
let failure = ServerResponse.failure("Out Of Cheese!")
let redirect = ServerResponse.redirect(300)

// the switch's value matches against the name of the constant, not the case of the enum
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure....\(message)")
    // TODO: Add a third case to ServerResponse and to the switch
case let .redirect(error):
    print("\(error). Redirecting...Please Wait")
}

// Struct

// Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, value based, but classes are passed by reference, inheritance.

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    // TODO: Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
    func createDeck() -> [Card] {
        let suits = [Suit.spades, Suit.hearts, Suit.clubs, Suit.diamonds]
        var deck = [Card]()
        
        for theSuit in suits {
            for theRank in Rank.ace.rawValue...Rank.king.rawValue {
                deck.append(Card(rank: Rank(rawValue: theRank)!, suit: theSuit))
            }
        }
        
        return deck
    }
    
    /*
     Explanation of createDeck():
        - createDeck() return an array of Cars
        - create a constant for suits
        - create an empty array of type Card
        - create a for loop to iterate through each suit in suits, then a for loop inside that will run in each of the suits for a range from ace to king
        - appending each card to deck then return deck
     
     Hindsight:
        - I was thinking of solutions with far too complexity for a simple exercise, like having a subclass deck under Cards and the like
        - Using range, but the actual rawValue, which is of type Int and part of the enum, is better than a "generic" range of 13 cards
        - Shouldn't be force unwrapping things, but to make it cleaner that I personally like, this hits the first point again
        - This implementation requires a specification of an instance created with parameters rather than var newDeck = Card()
    */
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

let aceOfHearts = Card(rank: .ace, suit: .hearts)
let deck = aceOfHearts.createDeck()
//print(deck)

/*  
    .color is not available for Card, where it was retroactively added to one of its subclasses.
    This was that case that Tom was asking about in terms of inheritance.
    Look for solutions to this aside from "not doing it in the first place."
    In terms of fixing/working with legacy codes in situations like this.
 */
print(threeOfSpades.suit.color())


// Protocols And Extensions

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
    
}

// Classes, enumerations, and structs can all adpot protocols
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    // its not written as mutating func because a method in a class can always modify the class
    func adjust() {
        simpleDescription += "Now It's 100% Adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    
    mutating func adjust() {
       simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// TODO: Write an enumeration that conforms to this protocol
enum SimpleEnumeration: ExampleProtocol {
    case basic, adjusted
    
    // Enums do not take stored properties so do the following:
    var simpleDescription: String {
        switch self {
        case  .basic:
            return "A simple Enumeration, currently basic"
        case .adjusted:
            return "A simple Enumeration, now adjusted"
        }
    }
    
    mutating func adjust() {
        self = .adjusted
    }
} // end of enum

var c = SimpleEnumeration.basic
c.simpleDescription // this is basic
c.adjust()
c.simpleDescription // this is adjusted

// use extensions to add functionality to an existing type, such as new methods, computed properties, to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or a framework.

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)
/*
 print(7.adjust())
    - This throws an error, cannot use mutating member on immutable value: literals are not mutable
    - Literals, the 7, cannot change because it's a 7, the 7, where as a variable with a copy of that can be
    - var upgradedSevenWithAdjust = 7 with .adjust() called on the var and NOT the 7.
 */
var upgradedSevenWithAdjust = 7
upgradedSevenWithAdjust.adjust() // the variable has changed to 49 from 7
print(upgradedSevenWithAdjust) // prints 49

// TODO: Write an extension for the Double type that adds an absoluteValue property
extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    
    var absoluteValue: Double {
        if self > 0.0 {
            return self
        } else {
            return -1 * self
        }
    }
    
    mutating func adjust() {
        self -= 10
    }
}

print(1.5.simpleDescription)
var doubleSeven = 7.0
print(doubleSeven) // prints 7.0
doubleSeven.adjust()
print(doubleSeven) // prints -3.0 after adjust
doubleSeven.absoluteValue // prints 3, which is correct because absolute value is never negative and only denotes how many values it is from 0

// You can use a protocol name just liky any other named type - for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription) // prints "A very simple class.Now It's 100% Adjusted."
//print(protocolValue.anotherProperty) // throws an error: value of type 'ExampleProtocol' has no member 'anotherProperty'

// Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can't accidentally access methods or properties that the class implements in addition to its protocol conformance.

// =============================
// Error Handling ==============
// =============================

// Errors can be represented using any type that adopts the Error protocol.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// Use throw to throw an error and throws to mark a function that can throw an error. If you throw an error in a function, the function returns immediately and the code that called the function handles the error.

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job Sent"
}

// There are several ways to handle errors. One way is to use do-catch. Inside the do block, you mark code that can throw an error by writing try in front of it. Inside the catch block, the error is automatically given the name error unless you give it a different name.

do {
    // TODO: Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
//    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng") // prints "Job Sent"
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// you can provide multiple catch blocks that handle specific errors. You write a pattern after catch just as you do after case in a switch.

// TODO: Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

// Another way to handle errors is to use try? to convert the result to an optional. If the function throws an error, the specific error is discarded and the result is nil. Otherwise, the result is an optional containing the value that the function returned.

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// Use defer to write a block of code that is executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)

// =============================
// Generics ====================
// =============================

// Name inside angle brackets to make a generic function or type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}

makeArray(repeating: "knock", numberOfTimes: 4)

// you can make generic forms of functions and methods, as well as classes, enumerations, and structures.
// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

// Use where right before the body to specify a list of requirements - for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.

// TODO: Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common
/*
func anyCommonElements<T: Sequence, U: Sequence>() -> Bool where T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}

anyCommonElements([1, 2, 3], [3])
*/

// The above function will return true if the two sequences passed in have any common elements
// Modify the function to make a function that returns the array of the elements that any two sequences have in common

/*
func getCommonElements<T, U where T: Sequence, U: Sequence, T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element> (lhs: T, rhs: U) -> [T.Iterator.Element] {
    var seq: [T.Iterator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                seq.append(lhsItem)
            }
        }
    }
    
    return seq
}

getCommonElements([1, 2, 3, 30], [1, 10, 30])
*/

// Writing <T: Equatable> is the same as writing <T> ... where T: Equatable

















