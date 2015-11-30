//
//  AlertViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 11/27/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation
import UIKit

enum ActionButton: Int {
    case Back = 1
    case Menu = 2
}

class AlertViewController : UIViewController {
    static var navController: UINavigationController?
    
    @IBAction func dismissAlert(sender: AnyObject) {
        if sender.tag! == ActionButton.Back.rawValue {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            if let nav = AlertViewController.navController {
                self.dismissViewControllerAnimated(false, completion: { () -> Void in
                    nav.popToRootViewControllerAnimated(true)
                })
            } else {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}