//
//  FirstViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 9/13/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func objectMilk(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectLollipop(sender: AnyObject){
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectiPad(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectDonut(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectChoco(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectApple(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectBook(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectBall(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectBear(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
    }
    
    @IBAction func objectPencil(sender: AnyObject) {
        performSegueWithIdentifier("PAGAR", sender: self)
        
    }
}

