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
    
    var selected = [Int:Int]()
    
    var startPanPosition: CGPoint?
    var previousPanPosition: CGPoint?
    
    // Outlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMoneyLeft: UILabel!
    @IBOutlet weak var lblAcum: UILabel!
    @IBOutlet weak var moneyBagView: UIView!
    @IBOutlet weak var dropZoneView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game.startGame(item, level: Level.TWO)
        setup()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        let price = self.game.itemToBuy?.price
        self.lblPrice.text = "$\(price!) pesos"
        self.lblMoneyLeft.text = "$\(price!) pesos"
        self.selected[1] = 0
        self.selected[2] = 0
        self.selected[5] = 0
        self.selected[10] = 0
        self.selected[20] = 0
        self.selected[50] = 0
        self.selected[100] = 0

        
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

    private func pay(quantity: Int) {
        print("quantity: \(quantity)")
        let added = game.addQuantity(quantity)
        if (added) {
            selected[quantity] = selected[quantity]! + 1
            print(selected)
            updateUI()
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
        self.lblAcum.text = "$\(game.moneyAcum) pesos"
        self.lblMoneyLeft.text = "$\(game.moneyLeft()) pesos"
    }
    
    private func alert(msg: String) {
        UIAlertView(title: "Mensaje", message: msg, delegate: nil, cancelButtonTitle: "OK").show()
    }
    
    func moneyDragged(gesture: UIPanGestureRecognizer) {
        let pos = gesture.locationInView(self.moneyBagView)
        let view = gesture.view!
        var frame = view.frame
        
        switch gesture.state {
        case UIGestureRecognizerState.Began:
            self.startPanPosition = view.frame.origin
        case UIGestureRecognizerState.Changed:
            frame.origin = pos
            view.center = pos
        case UIGestureRecognizerState.Ended:
            // If drags to the DROP ZONE
            if draggedIntoDropZone(gesture) {
                // Check quantity dragged
                let quantity = gesture.view!.tag
                self.pay(quantity)
            }
            // Restart its original position
            frame.origin = self.startPanPosition!
            view.frame = frame
        default:
            break
        }
    }
    
    private func draggedIntoDropZone(gesture: UIPanGestureRecognizer) -> Bool {
        return CGRectContainsPoint(self.dropZoneView.bounds, gesture.locationInView(self.dropZoneView))
    }
}

