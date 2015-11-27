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
    var item: Item = Item(name: "Osito", img: "osito.png")
    
    var selected: [Int] = [Int]()
    
    var startPanPosition: CGPoint?
    var previousPanPosition: CGPoint?
    
    // Outlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMoneyLeft: UILabel!
    @IBOutlet weak var lblAcum: UILabel!
    @IBOutlet weak var moneyBagView: UIView!
    
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
            alert("¡Felicidades! Manejas muy bien el dinero!!!")
        }
    }
    
    private func updateLBL(lbl: UILabel, q: Int) {
        lbl.hidden = false
        lbl.text = "\(selected[q])"
    }
    
    private func updateUI() {
        self.lblAcum.text = "LLEVAS $\(game.moneyAcum) PESOS"
        self.lblMoneyLeft.text = "$\(game.moneyLeft()) PESOS"
    }
    
    private func alert(msg: String) {
        UIAlertView(title: "Mensaje", message: msg, delegate: nil, cancelButtonTitle: "OK").show()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game.startGame(item, level: Level.TWO)
        setup()
    }
    
    private func setup() {
        let price = self.game.itemToBuy?.price
        self.lblPrice.text = "$\(price!) PESOS"
        self.lblMoneyLeft.text = "$\(price) PESOS"
        self.selected = [Int]()
        for _ in 1...110 {
            selected.append(0)
        }
        
        // Add pan gesture to each button
        var buttons = [UIButton]()
        buttons.append(self.view.viewWithTag(1) as! UIButton)
        buttons.append(self.view.viewWithTag(2) as! UIButton)
        buttons.append(self.view.viewWithTag(5) as! UIButton)
        buttons.append(self.view.viewWithTag(10) as! UIButton)
        buttons.append(self.view.viewWithTag(20) as! UIButton)
        buttons.append(self.view.viewWithTag(50) as! UIButton)
        buttons.append(self.view.viewWithTag(100) as! UIButton)
        for btn in buttons {
            let gesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "moneyDragged:")
            btn.addGestureRecognizer(gesture)
        }
    }
    
    
    func moneyDragged(gesture: UIPanGestureRecognizer) {
        var pos = gesture.locationInView(moneyBagView)

        let view = gesture.view!
        var frame = view.frame
        
        switch gesture.state {
        case UIGestureRecognizerState.Began:
            self.startPanPosition = view.frame.origin
        case UIGestureRecognizerState.Changed:
            frame.origin = pos
            view.center = pos
        case UIGestureRecognizerState.Ended:
            frame.origin = self.startPanPosition!
            view.frame = frame
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

