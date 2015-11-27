//
//  GameManager.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 10/12/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation

enum Level {
    case ONE, TWO, THREE
}

class GameManager {
    var objects: [Item] = [
        Item(name: "osito", img: "osito.png"),
        Item(name: "manzana", img: "manzana.png"),
        Item(name: "chocolate", img: "chocolate.png"),
        Item(name: "pan", img: "pan.png"),
        Item(name: "pelota", img: "pelota.png"),
        Item(name: "leche", img: "leche.jpg"),
        Item(name: "libro", img: "libro.png"),
        Item(name: "ipad", img: "ipad.jpg"),
        Item(name: "lapiz", img: "lapiz.png"),
        Item(name: "dulce", img: "dulce.png"),
    ]

    var itemToBuy: Item?
    var moneyAcum: Int
    var successful: Bool

	func checkForError() {
		if (successful == false) {
			print("Casi lo logras! te pasaste por tantito.")
		}
	}
    
    func selectItem(item: Item) -> Item? {
//        for i in objects {
//            if item.img == i.img {
//                return i
//            }
//        }
//        return Optional<Item>()
        let randomIndex = Int(arc4random_uniform(UInt32(objects.count)))
        return objects[randomIndex]
    }
    
    func startGame(itemToBuy: Item, level: Level) {
        self.itemToBuy = selectItem(itemToBuy)
        self.itemToBuy?.price = getRandomPriceForLevel(level)
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
    
    private func getRandomPriceForLevel(level: Level) -> Int {
        let multiplier: Int = level == Level.TWO ? 5 : 1
        // Random number between 0 and 40 to create a price that 10 <= price <= 200
        let randomNumber = Int(arc4random_uniform(UInt32(200)))
        let price = 10 + randomNumber * multiplier
        return price
    }
    
}