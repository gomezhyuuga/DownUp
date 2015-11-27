//
//  LevelsViewController.swift
//  DownUp
//
//  Created by aileennag on 26/11/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender?.tag == 2 {
            ViewController.level = Level.TWO
        } else if sender?.tag == 3 {
            ViewController.level = Level.THREE
        }
    }
}