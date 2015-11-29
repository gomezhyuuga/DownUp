//
//  GameViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 9/13/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game = GameManager()
    static var item: Item?
    static var level: Level?
    
    var selected = [Int:Int]()
    
    var startPanPosition: CGPoint?
    var previousPanPosition: CGPoint?
    
    var start: NSDate!
    var finish: NSDate!
    var today: Int = 0
    
    // Outlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMoneyLeft: UILabel!
    @IBOutlet weak var lblAcum: UILabel!
    @IBOutlet weak var moneyBagView: UIView!
    @IBOutlet weak var dropZoneView: UIView!
    @IBOutlet weak var imgItem: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game.startGame(GameViewController.item!, level: GameViewController.level!)
        setup()
        getDayOfTheWeek()
        print("\(self.today)")
        self.start = NSDate()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func getDayOfTheWeek() {
        let dateNow = NSDate()
        let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let dateComponents = calendar?.components(.Weekday, fromDate: dateNow)
        let weekday = dateComponents?.weekday
        self.today = weekday!
    }
    
    private func setup() {
        let imagePath = NSBundle.mainBundle().pathForResource(self.game.itemToBuy!.img, ofType: "png")
        self.imgItem.image = UIImage(contentsOfFile: imagePath!)
        self.lblItemName.text = self.game.itemToBuy?.name
        let price = self.game.itemToBuy!.price
        self.lblPrice.text = "$\(price) pesos"
        self.lblMoneyLeft.text = "$\(price) pesos"
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
        let added = game.addQuantity(quantity)
        if (added) {
            selected[quantity] = selected[quantity]! + 1
            updateUI()
        } else {
            alert("FAIL")
        }
        if (game.gameHasFinished()) {
            self.finish = NSDate()
            let timeTaken: Double = finish.timeIntervalSinceDate(start)
            var prefsKey: String = ""
            
            switch(self.today) {
            case 1:
                prefsKey = "Level2Sunday"
                break
            case 2:
                prefsKey = "Level2Monday"
                break
            case 3:
                prefsKey = "Level2Tuesday"
                break
            case 4:
                prefsKey = "Level2Wednesday"
                break
            case 5:
                prefsKey = "Level2Thursday"
                break
            case 6:
                prefsKey = "Level2Friday"
                break
            case 7:
                prefsKey = "Level2Saturday"
                break
            default:
                break
            }
            
            NSUserDefaults.standardUserDefaults().setDouble(timeTaken, forKey: prefsKey)
            
            print("\(timeTaken) seconds.")
            alert("DONE")
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
        if msg == "FAIL" {
            performSegueWithIdentifier("alertFAIL", sender: self)
        } else {
            performSegueWithIdentifier("alertDONE", sender: self)
        }
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
                let quantity = gesture.view!.tag    //image.tag       checkValue(pos, quantity)
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


/*var frm: CGRect = imageView.frame
frm.origin.x = frm.origin.x - 50
frm.origin.y = frm.origin.y - 50
frm.size.width = frm.size.width + 500
frm.size.height = frm.size.height + 500
imageView.frame = frm
*/

