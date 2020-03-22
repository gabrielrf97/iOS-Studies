import UIKit

var str = "Hello, playground"

enum EmptyEnum: Double {
    case smallScreenProportion = 2.3
    case bigScreenProportion = 2
}

MemoryLayout<EmptyEnum>.size
MemoryLayout<EmptyEnum>.stride
MemoryLayout<EmptyEnum>.alignment

struct EmptyStruct {
    static let smallScreenProportion: CGFloat = 2.3
    let bigScreenProportion: CGFloat = 2
}

MemoryLayout<EmptyStruct>.size
MemoryLayout<EmptyStruct>.stride
MemoryLayout<EmptyStruct>.alignment
