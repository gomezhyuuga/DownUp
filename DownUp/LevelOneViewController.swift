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
    
    
    //Outlets
    @IBOutlet weak var cincuentaView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureButtons()
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
