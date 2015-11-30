//
//  LevelsViewController.swift
//  DownUp
//
//  Created by aileennag on 26/11/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {
    
    @IBAction func back(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}