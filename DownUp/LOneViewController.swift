//
//  LOneViewController.swift
//  DownUp
//
//  Created by aileennag on 29/11/15.
//  Copyright © 2015 Fernando Gómez. All rights reserved.
//

import Foundation
import UIKit


struct Question {
    var Image: UIImage!
    var Answers: [String]
    var Answer: Int!
}

class LOneViewController: UIViewController {
    
    static var level: Level = Level.ONE
    var start: NSDate!
    var finish: NSDate!
    var today: Int = 0
    var arrImages = ["1peso.png","2pesos.png","5pesos.png","10pesos.png","20pesos.png","50peso.png","100pesos.png"];
    var Questions = [Question]()
    var qNum = Int()
    var aNum = Int()
    
    //Outlets
    @IBOutlet weak var imageRan: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    
    @IBAction func back(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlertViewController.navController = navigationController
        getDayOfTheWeek()
        print("\(self.today)")
        self.start = NSDate()
        let image = UIImage(named: arrImages[0])
        let image1 = UIImage(named: arrImages[1])
        let image2 = UIImage(named: arrImages[2])
        let image3 = UIImage(named: arrImages[3])
        let image4 = UIImage(named: arrImages[4])
        let image5 = UIImage(named: arrImages[5])
        let image6 = UIImage(named: arrImages[6])
        Questions = [Question(Image: image, Answers: ["2 pesos - Dos pesos","10 pesos - Diez pesos","5 pesos - Cinco pesos","1 peso - Un peso"], Answer: 3), Question(Image: image1, Answers: ["20 pesos - Veinte pesos","5 pesos - Cinco pesos","2 pesos - Dos pesos","10 pesos - Diez pesos"], Answer: 2), Question(Image: image2, Answers: ["5 pesos - Cinco pesos","100 pesos - Cien pesos","50 pesos - Cincuenta pesos","2 pesos - Dos pesos"], Answer: 0), Question(Image: image3, Answers: ["100 pesos - Cien pesos","10 pesos - Diez pesos","1 peso - Un peso","20 pesos - Veinte pesos"], Answer: 1), Question(Image: image4, Answers: ["5 pesos - Cinco pesos","20 pesos - Veinte pesos","2 pesos - Dos pesos","10 pesos - Diez pesos"], Answer: 1), Question(Image: image5, Answers: ["5 pesos - Cinco pesos","10 pesos - Diez pesos","50 pesos - Cincuenta pesos","100 pesos - Cien pesos"], Answer: 2), Question(Image: image6, Answers: ["50 pesos - Cincuenta pesos","100 pesos - Cien pesos","1 peso - Un peso","10 pesos - Diez pesos"], Answer: 1)]
        pickQuestion()
        // Do any additional setup after loading the view.
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
    
    func pickQuestion(){
        if Questions.count > 0{
            qNum = random()%Questions.count
            imageRan.image = Questions[qNum].Image
            aNum = Questions[qNum].Answer
            
            for i in 0..<Buttons.count{
                Buttons[i].setTitle(Questions[qNum].Answers[i], forState: UIControlState.Normal)
            }
            Questions.removeAtIndex(qNum)
        }else{
            print("Done")
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
    
    @IBAction func btn1(sender: AnyObject) {
        if aNum == 0{
            pickQuestion()
        }else{
            alert("FAIL")
        }
    }
    
    @IBAction func btn2(sender: AnyObject) {
        if aNum == 1{
            pickQuestion()
        }else{
            alert("FAIL")
        }
    }
    
    @IBAction func btn3(sender: AnyObject) {
        if aNum == 2{
            pickQuestion()
        }else{
            alert("FAIL")
        }
    }
    
    
    @IBAction func btn4(sender: AnyObject) {
        if aNum == 3{
            pickQuestion()
        }else{
           alert("FAIL")
        }
    }

    private func alert(msg: String) {
        if msg == "FAIL" {
            performSegueWithIdentifier("intentalo", sender: self)
        } else {
            performSegueWithIdentifier("felicidades", sender: self)
        }
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
