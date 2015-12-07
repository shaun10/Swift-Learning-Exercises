//: # Strings

import UIKit
import Foundation

//: ## Defining Strings using string literals
let myFirstString = "mo 💰"
let mySecondString = "mo problems"

//: ## String concatenation
let theTruth = myFirstString + ", " + mySecondString

//: ## Emoji characters
let similarTruth = "💰can't 😙buy me 💖"

//: ## String interpolation

//: ### Plain string
var doggyDiet = "Lulu eats 25lbs of dog food per month"
//: ### String with variables
var dogName = "Ferris"
var ferrisPic = UIImage(named:"SpringerdoodleFerris.jpg")!
doggyDiet = "\(dogName) eats 25lbs of dog food per month"

//: ### String with variables and expression
var lbsPerDay = 0.75
var daysPerMonth:Double = 31
doggyDiet = "\(dogName) eats ?lbs of dog food per month"

var frankiePic = UIImage(named:"frankie.jpeg")!
lbsPerDay = 0.25
dogName = "Sam"
doggyDiet = "\(dogName) eats \(lbsPerDay * daysPerMonth) of dog food per month"
//: ## A String isn't just a String

//: ### A String is an Array of Characters
var password = "Meet me in St. Louis"
for character in password.characters {
    if character == "i" {
        print("Hi mom")
    }
}

//: ### A String can be treated as an NSString
let newPassword = password.stringByReplacingOccurrencesOfString("e", withString: "3")





