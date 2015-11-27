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
        Item(name: "osito", img: "osito.png", price: 85),
        Item(name: "manzana", img: "manzana.png", price: 8),
        Item(name: "chocolate", img: "chocolate.png", price: 7),
        Item(name: "pan", img: "pan.png", price: 1),
        Item(name: "pelota", img: "pelota.png", price: 4),
        Item(name: "leche", img: "leche.jpg", price: 5),
        Item(name: "libro", img: "libro.png", price: 3),
        Item(name: "ipad", img: "ipad.jpg", price: 70),
        Item(name: "lapiz", img: "lapiz.png", price: 6),
        Item(name: "dulce", img: "dulce.png", price: 4),
    ]

    var itemToBuy: Item?
    var moneyAcum: Int
    var successful: Bool

	func checkForError() {
		if (successful == false) {
			print("Casi lo logras! te pasaste por tantito.")
		}
	}
    
    func selectItem(item: String) -> Item? {
        for i in objects {
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
    
    func addQuantity(quantity: Int) -> Bool {
    	if quantity + moneyAcum <= itemToBuy?.price {
			moneyAcum += quantity
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
        successful = true
    }
    
    
    
}


