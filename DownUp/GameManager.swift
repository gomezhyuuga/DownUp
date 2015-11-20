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
        Item(img: "osito.png", price: 20),
        Item(img: "manzana.png", price: 8),
        Item(img: "chocolate.png", price: 7),
        Item(img: "pan.png", price: 1),
        Item(img: "pelota.png", price: 4),
        Item(img: "leche.jpg", price: 5),
        Item(img: "libro.png", price: 3),
        Item(img: "ipad.jpg", price: 9),
        Item(img: "lapiz.png", price: 6),
        Item(img: "dulce.png", price: 4),
       
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


