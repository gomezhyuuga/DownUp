//
//  LevelsViewController.swift
//  DownUp
//
//  Created by aileennag on 26/11/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch sender!.tag {
        case 1:
            ViewController.level = Level.ONE
        case 2:
            ViewController.level = Level.TWO
        case 3:
            ViewController.level = Level.THREE
        default:
            break;
        }
    }
}