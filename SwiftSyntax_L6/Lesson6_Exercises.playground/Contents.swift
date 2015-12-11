//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    let species: String
    //create var of Tail
    let tail: Tail
    
    init(species: String, tailLength: Double){
        self.species = species
        self.tail = Tail(lengthInCm: tailLength)
    }
    
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
var tony = Animal(species: "Kangaroo", tailLength: 22)

//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    //the varieties of peaches will be static, assuming that GMO modifications are of a timely concern
    
    //can just set this array up straight
    static let varieties = ["gold", "yellow", "white"]
    
    func ripen()->String{
        self.softness += 1
        if self.softness >= 5{
            return "The peach is ripe, stop ripening it"
        }
        else{
          return "Edible but not really ripe yet"
        }
    }
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
}
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().
var tester = Peach(variety: "gold", softness: 2)
tester.ripen()


//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
var theFluffiestDog = UIImage(named:"fluffyDog")
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    
    var cuddability: Int{
        if self.fluffiness > 10 || self.droolFactor > 10{
            let cuteness = (self.fluffiness % 10) * (self.droolFactor % 10)
            return cuteness
        }
        else{
            let cuteness = (self.fluffiness * self.droolFactor)
            return cuteness
        }

    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
var powWow = FluffyDog(name: "Barker", fluffiness: 9, droolFactor: 9)
powWow.cuddability
//Super cute! Restricted ratings to 10 upper bound score of 100 is perfect. Cheaters who try 11 end up back at 1!
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case Small
    case Medium
    case Large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    func bark(size: Size)->String{
        if size == .Small{
            return "tiny"
        }
        else if size == .Medium{
            return "decent grade"
        }
        else{
            return "Wow, what a specimen"
        }
    }
    static func speak(size: Size)-> String{
        switch size{
        case .Large:
            return "Wow thats a biggie"
        case .Medium:
            return "Decent size"
        default:
            return "Too tiny!"
        }
        
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
var littleJR = ChattyDog(name: "JR", breed: "Chihuahua", size: .Small)
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
littleJR.bark(.Medium)
ChattyDog.speak(.Medium)
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case Poor, Fair, Good, Excellent
}

enum NaturalDisaster {
    case Earthquake
    case Wildfire
    case Hurricane
}

class House {
    let numberOfBedrooms: Int
    let location: Quality
 
    init(numberOfBedrooms: Int, location: Quality){
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
    
    func worthyOfAnOffer()->Bool{
        if (self.numberOfBedrooms > 1 && (self.location == .Good || self.location == .Excellent)){
            return true
        }
        else{return false}
    }
    
    func willStayStanding(naturalDisaster:NaturalDisaster)-> Bool {
        switch location{
        case .Excellent, .Good:
            switch naturalDisaster {
            case .Earthquake:
                return true
            case .Wildfire:
                return true
            case .Hurricane:
                return true
            }
        
        case .Fair:
            switch naturalDisaster {
            case .Earthquake:
                return true
            case .Wildfire:
                return false
            case .Hurricane:
                return false
            }
        default:
            return false
        }
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
var myHouse = House(numberOfBedrooms: 4, location: .Fair)
myHouse.willStayStanding(.Wildfire)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.
myHouse.worthyOfAnOffer()
//Boo




