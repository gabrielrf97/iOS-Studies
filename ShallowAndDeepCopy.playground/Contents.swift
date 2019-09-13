import UIKit

class Address: NSCopying {
    var city: String?
    
    init(city: String) {
        self.city = city
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Address(city: self.city!)
    }
}

class Person: NSCopying {
    
    var name: String?
    var address: Address?
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person(name: self.name!, address: self.address!.copy() as! Address)
    }
}

var address = Address(city: "San Fran")
var joe = Person(name: "Joe", address: address)
joe.address

var nicky = joe.copy() as! Person
nicky.address = Address(city: "Hong Kong")
nicky.name = "Nicky"
print(joe.name, nicky.name)
