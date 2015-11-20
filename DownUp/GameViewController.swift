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
    
    var selected: [Int] = [Int]()
    
    // Outlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMoneyLeft: UILabel!
    @IBOutlet weak var lblAcum: UILabel!
    
    @IBOutlet weak var lblQ1: UILabel!
    
    @IBOutlet weak var lblQ10: UILabel!
    @IBOutlet weak var lblQ5: UILabel!
    @IBOutlet weak var lblQ2: UILabel!
    @IBOutlet weak var lblQ20: UILabel!
    @IBOutlet weak var lblQ50: UILabel!
    @IBOutlet weak var lblQ100: UILabel!

    @IBAction func pay(sender: UIButton) {
        let quantity = sender.accessibilityIdentifier
        print("quantity: \(quantity!)")
        let q = Int(quantity!)!
        let added = game.addQuantity(q)
        if (added) {
            updateUI()
            selected[q] += 1
            switch q {
            case 1:
                updateLBL(lblQ1, q: q)
            case 2:
                updateLBL(lblQ2, q: q)
            case 5:
                updateLBL(lblQ5, q: q)
            case 10:
                updateLBL(lblQ10, q: q)
            case 20:
                updateLBL(lblQ20, q: q)
            case 50:
                updateLBL(lblQ50, q: q)
            case 100:
                updateLBL(lblQ100, q: q)
            default:
                break;
            }
        } else {
            alert("Te pasaste de dinero")
        }
        if (game.gameHasFinished()) {
            alert("¡FELICIDADES! MANEJAS MUY BIEN EL DINERO")
        }
    }
    
    private func updateLBL(lbl: UILabel, q: Int) {
        lbl.hidden = false
        lbl.text = "\(selected[q])"
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
        self.selected = [Int]()
        for i in 1...110 {
            selected.append(0)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

