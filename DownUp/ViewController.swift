//
//  FirstViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 9/13/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var objects: [Item] = [
        Item(name: "osito", img: "osito"),
        Item(name: "manzana", img: "manzana"),
        Item(name: "chocolate", img: "chocolate"),
        Item(name: "pan", img: "pan"),
        Item(name: "pelota", img: "pelota"),
        Item(name: "leche", img: "leche"),
        Item(name: "libro", img: "libro"),
        Item(name: "ipad", img: "ipad"),
        Item(name: "lapiz", img: "lapiz"),
        Item(name: "dulce", img: "dulce"),
    ]
    
    static var level: Level = Level.TWO
    
    override func viewWillAppear(animated: Bool) {
        objects.shuffleInPlace()
        for i in 1...10 {
            // Load random UIImage
            let button: UIButton = self.view.viewWithTag(i) as! UIButton
            let imageName = objects[i - 1].img
            let image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(imageName, ofType: "png")!)
            button.setImage(image, forState: UIControlState.Normal)
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let object = objects[sender!.tag - 1]
        let item = Item(name: object.name, img: object.img)
        GameViewController.item = item
        GameViewController.level = ViewController.level
    }
    
    private func selectItem() -> Item? {
        let randomIndex = Int(arc4random_uniform(UInt32(objects.count)))
        return objects[randomIndex]
    }
}