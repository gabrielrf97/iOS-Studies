//
//  Glass.swift
//  UGlass-iOS
//
//  Created by Gabriel on 19/09/19.
//  Copyright © 2019 Gabriel. All rights reserved.
//

import Foundation

enum FaceShape {
    case circular
    case oval
    case squared
    case hearted
    case diamond
}

enum PersonalStyle {
    case clear
    case darker
    case simple
    case stylish
}

class Glass {
    var id: String
    var name: String
    var code: String?
    var idealShapes: [FaceShape]!
    var personalStyle: [PersonalStyle]!
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

