//
//  Session.swift
//  UGlass-iOS
//
//  Created by Gabriel on 19/09/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

enum GenderOption {
    case male
    case female
    case unidentified
}

enum SkinTone {
    
}

class Session {
    var sex: GenderOption?
    var skinTone: SkinTone?
    var date: Date?
    var bestGlasses: [Glass]!
    var didBuy: Bool!
    var chosenGlasses: [Glass]?
}
