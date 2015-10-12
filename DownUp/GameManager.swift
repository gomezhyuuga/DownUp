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
        Item(img: "osito.jpg", price: 2),
        Item(img: "asd.jpg", price: 8),
        Item(img: “cho.jpg", price: 7),
        Item(img: “pan.jpg", price: 1),
        Item(img: “cereal.jpg", price: 4),
        Item(img: “leche.jpg", price: 5),
        Item(img: “libro.jpg", price: 3),
        Item(img: “ipad.jpg", price: 9),
        Item(img: “lapiz.jpg", price: 6),
        Item(img: “dulce.jpg", price: 4),
       
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
        if moneyAcum >= itemToBuy?.price {
			return true;
		} else {
			return false;
		}
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
