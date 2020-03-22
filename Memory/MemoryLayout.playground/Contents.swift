import UIKit
import Foundation

//Trivial types - structs & enums | Non-trivial types - classes

MemoryLayout<Int>.size
MemoryLayout<Bool>.size

struct EmptyStruct {}
MemoryLayout<EmptyStruct>.size
MemoryLayout<EmptyStruct>.stride
MemoryLayout<EmptyStruct>.alignment

class EmptyClass {}
MemoryLayout<EmptyClass>.size
MemoryLayout<EmptyClass>.stride
MemoryLayout<EmptyClass>.alignment

struct NonEmptyStruct {
    var int: Int
    var bool: Bool
}
MemoryLayout<NonEmptyStruct>.size
MemoryLayout<NonEmptyStruct>.stride
MemoryLayout<NonEmptyStruct>.alignment
MemoryLayout<NonEmptyStruct>.offset(of: \NonEmptyStruct.bool)

struct NonEmptyClass {
    var int: Int = 0
    var bool = false
}
MemoryLayout<NonEmptyClass>.size
MemoryLayout<NonEmptyClass>.stride
MemoryLayout<NonEmptyClass>.alignment

//Unsafe Fundamentals

//Pointers types -> Memory / Mutable, Bytes / Raw, Sequences & Collections / Buffer, Types / Pointee
//Memory must be bound to one type


