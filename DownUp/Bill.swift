//
//  Bill.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 10/12/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation

struct Bill {
    let quantity: Int
    let img_path: String

    init(quantity: Int) {
        self.quantity = quantity
        self.img_path = "bills/\(quantity)"
    }
}
