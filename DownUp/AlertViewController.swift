//
//  AlertViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 11/27/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation
import UIKit

class AlertViewController : UIViewController {
    
    @IBAction func dismissAlert(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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