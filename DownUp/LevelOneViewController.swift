//
//  LevelOneViewController.swift
//  DownUp
//
//  Created by aileennag on 28/11/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import UIKit

class LevelOneViewController: UIViewController {

    var startPanPosition: CGPoint?
    var previousPanPosition: CGPoint?
    
    var start: NSDate!
    var finish: NSDate!
    var today: Int = 0
    static var level: Level = Level.ONE
    var arrImages = ["n1.png","n2.png","n5.png","n10.png","n20.png","n50.png","n100.png"];
    
    //Outlets
    @IBOutlet weak var cincuentaView: UIView!
    @IBOutlet weak var cincuenta: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureButtons()
        getDayOfTheWeek()
        imageposition(cincuenta)
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
    
    private func gestureButtons(){
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
        let pos = gesture.locationInView(self.view)
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
            }
            // Restart its original position
            frame.origin = pos
            view.frame = frame
        default:
            break
        }
    }

    
    private func draggedIntoDropZone(gesture: UIPanGestureRecognizer) -> Bool {
        return CGRectContainsPoint(self.cincuentaView.bounds, gesture.locationInView(self.cincuentaView))
    }
    
    func ranImages(){
        for i in 0..<arrImages.count{
            let j: Int = Int(arc4random())%arrImages.count;
            let aux = arrImages[i]
            arrImages[i] = arrImages[j]
            arrImages[j]=aux
        }
    }
    
    func imageposition(image: UIImageView){
        image.frame = CGRect(x: image.frame.origin.x, y: image.frame.origin.y, width: image.frame.size.width, height: image.frame.size.height)
        let pos = image.frame
        print("\(pos)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
