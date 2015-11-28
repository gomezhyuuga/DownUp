//
//  Item.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 10/12/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation

struct Item {
    let name: String
    let img: String
    var price: Int
    
    init(name: String, img: String) {
        self.name = name
        self.img = img
        self.price = 0
    }
}
