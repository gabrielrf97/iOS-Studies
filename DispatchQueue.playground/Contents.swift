import UIKit
import Foundation

//operators -> objc, nonobjc, dynamic, final, @inline


struct TestStruct {
//    Doenst allow subclassing, therefore all method dispatchs are static
    func staticDispatchFunc() {}
}

extension TestStruct {
//    Doenst allow subclassing, therefore all method dispatchs are static
     func anotherStaticDispatchFunc() {}
}


class TestClass {
//  table - here
//  message = dynamic
    func tableDispatchMethod(){}
    dynamic func dynamicDispathMethod() {}
    final func staticDispatchMethod() {}
}

extension TestClass {
//  static - here or final
    func anotherStaticDispatchMethod(){}
    dynamic func messageDispathMethod(){}
    @objc func anotherMessageDispathMethod() {}
}

protocol SomeProtocol {
//  table - here
//  message - dynamic
    func tableDispathMethod()
    dynamic func messageDispathMethod()
}

extension SomeProtocol {
//  static - here
    func staticDispath() {}
    dynamic func messageDispath() {}
    func anotherMessageDispath() {}
}

class TestNsObject: NSObject {
//    final - direct dispatch or @nonobjc
//    table - here
}

extension TestNsObject {
//    message - here or dynamic
}
