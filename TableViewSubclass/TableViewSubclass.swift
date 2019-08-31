//
//  TableViewSubclass.swift
//  TableViewSubclass
//
//  Created by Gabriel on 31/08/19.
//  Copyright © 2019 gabrielrodrigues. All rights reserved.
//

import UIKit

class TableViewSubclass: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setDarkBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setDarkBackground()
    }
    
    func setDarkBackground() {
        self.backgroundColor = .gray
    }

}
