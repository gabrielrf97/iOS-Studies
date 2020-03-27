import UIKit

var str = "Hello, playground"

class Person {
    var name: String!
    
    init(name: String) {
        self.name = name
        print("Person allocated")
    }
    
    deinit {
        print("Person in gone.")
    }
}

var _name = ""

func changeName(person: Person, to name: String, completion: @escaping ()->()) {
    sleep(2)
    _name = name
    completion()
}



do {
    var john = Person(name: "John")
   
    DispatchQueue.main.async {
        changeName(person: john, to: "Lucas", completion: { [unowned self] in
            print("John's new name is \(self.name)")
        })
    }
    print("should dealocate")
}


