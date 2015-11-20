//
//  FirstViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 9/13/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game = GameManager()
    var item: Item = Item(img: "osito.png", price: 33)
    
    // Outlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMoneyLeft: UILabel!
    @IBOutlet weak var lblAcum: UILabel!

    @IBAction func pay(sender: UIButton) {
        let quantity = sender.accessibilityIdentifier
        print("quantity: \(quantity!)")
        let q = Int(quantity!)
        let added = game.addQuantity(q!)
        if (added) {
            updateUI()
        } else {
            alert("Te pasaste de dinero")
        }
        if (game.gameHasFinished()) {
            alert("¡FELICIDADES! MANEJAS MUY BIEN EL DINERO")
        }
    }
    
    private func updateUI() {
        self.lblAcum.text = "$\(game.moneyAcum) PESOS"
        self.lblMoneyLeft.text = "$\(game.moneyLeft()) PESOS"
    }
    
    private func alert(msg: String) {
        UIAlertView(title: "AVISO", message: msg, delegate: nil, cancelButtonTitle: "OK").show()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game.startGame(self.item.img)
        setup()
    }
    
    private func setup() {
        let price = self.game.itemToBuy?.price
        self.lblPrice.text = "$\(price!) PESOS"
        self.lblMoneyLeft.text = "$\(price) PESOS"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

