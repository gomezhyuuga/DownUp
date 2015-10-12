//
//  GameManager.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 10/12/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation

class GameManager {
    var items: [Item] = [
        Item(img: "osito.jpg", price: 20),
        Item(img: "asd.jpg", price: 100)
    ]
    var itemToBuy: Item?
    var moneyAcum: Int
    
    func selectItem(item: String) -> Item? {
        for i in items {
            if item == i.img {
                return i
            }
        }
        return Optional<Item>()
    }
    
    func startGame(itemToBuy: String) {
        self.itemToBuy = selectItem(itemToBuy)
    }
    
    func gameHasFinished() -> Bool {
        return false
    }
    
    func addQuantity(bill: Bill) -> Bool {
        if bill.quantity + moneyAcum <= itemToBuy?.price {
            moneyAcum += bill.quantity
            return true
        } else {
            return false
        }
        
    }
    
    func moneyLeft() -> Int {
        return (itemToBuy?.price)! - moneyAcum
    }
    
    init() {
        itemToBuy = Optional<Item>()
        moneyAcum = 0
    }
    
}