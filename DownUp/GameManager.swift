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
    var itemToBuy: Item?
    var moneyAcum: Int
    
    init() {
        self.itemToBuy = Optional<Item>()
        self.moneyAcum = 0
    }
    
    func startGame(itemToBuy: Item, level: Level) {
        self.itemToBuy = itemToBuy
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
    
    private func getRandomPriceForLevel(level: Level) -> Int {
        let multiplier: Int = level == Level.TWO ? 5 : 1
        let max: Int = level == Level.TWO ? 150 : 200
        let min: Int = 10
        // Random number between 0 and 40 to create a price that 10 <= price <= max
        let randomNumber = Int(arc4random_uniform(UInt32(max / multiplier)))
        let price = randomNumber < min ? min : randomNumber * multiplier
        return price
    }
    
}