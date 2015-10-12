//
//  GameManager.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 10/12/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation

class GameManager {
    var objects: [Item] = [
        Item(img: "osito.jpg", price: 20),
        Item(img: "asd.jpg", price: 100)
    ]
    var itemToBuy: Item
    var moneyAcum: Int
    
    func selectObject() {
        
    }
    
    func startGame() {}
    
    func gameHasFinished() -> Bool {
        return false
    }
    
    func addQuantity(q: Int) {
        moneyAcum += q
    }
    
    func moneyLeft() -> Int {
        return 0
    }
    
    init() {
        itemToBuy = Item(img: "nothing.jpg", price: 0)
        moneyAcum = 0
    }
    
}