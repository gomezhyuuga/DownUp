//
//  StatisticsViewController.swift
//  DownUp
//
//  Created by Fernando Gómez Herrera on 9/13/15.
//  Copyright (c) 2015 Fernando Gómez. All rights reserved.
//

import UIKit
import Charts

class StatisticsViewController: UIViewController {

    @IBOutlet weak var graphView: BarChartView!
    @IBOutlet weak var Level1Button: UIButton!
    @IBOutlet weak var Level2Button: UIButton!
    @IBOutlet weak var Level3Button: UIButton!
    
    var daysOfTheWeek: [String] = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"];
    var times: [Double] = [];
    var selectedLevel: Int = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        initDummyValues()
        setTags();
        times = readData(selectedLevel);
        setupChart(daysOfTheWeek, values: times);
    }
    
    // WARNING: This function is solely for testing purposes. Must be deleted once the app hits its completion state!!!!
    private func initDummyValues() {
        NSUserDefaults.standardUserDefaults().setDouble(9.8, forKey: "Level2Monday");
        NSUserDefaults.standardUserDefaults().setDouble(7.5, forKey: "Level2Tuesday");
        NSUserDefaults.standardUserDefaults().setDouble(11.2, forKey: "Level2Wednesday");
        NSUserDefaults.standardUserDefaults().setDouble(14.9, forKey: "Level2Thursday");
        NSUserDefaults.standardUserDefaults().setDouble(5.7, forKey: "Level2Friday");
    }
    
    private func setTags() {
        Level1Button.tag = 1;
        Level2Button.tag = 2;
        Level3Button.tag = 3;
    }
    
    private func setupChart(weekDays: [String], values: [Double]) {
        graphView.noDataText = "No hay datos históricos.";
        graphView.noDataTextDescription = "Contacte a su administrador.";
        
        var dataEntries: [BarChartDataEntry] = [];
        
        for i in 0 ..< daysOfTheWeek.count {
            let entry = BarChartDataEntry(value: values[i], xIndex: i);
            dataEntries.append(entry);
        }
        
        let dataSet = BarChartDataSet(yVals: dataEntries, label: "Tiempos por Día");
        dataSet.colors = ChartColorTemplates.colorful();
        
        let graphData = BarChartData(xVals: weekDays, dataSet: dataSet);
        graphView.data = graphData;
        graphView.descriptionText = "";
    }
    
    private func readData(level: Int) -> [Double] {
        let monKey = "Level2Monday";
        let tueKey = "Level2Tuesday";
        let wedKey = "Level2Wednesday";
        let thuKey = "Level2Thursday";
        let friKey = "Level2Friday";
        
        var levelTimes: [Double] = [];
        switch (level) {
        case 1:
            levelTimes = [1.0, 1.0, 1.0, 1.0, 1.0];
            break;
        case 2:
            levelTimes = [2.0, 2.0, 2.0, 2.0, 2.0];
            
            let monday = NSUserDefaults.standardUserDefaults().doubleForKey(monKey);
            let tuesday = NSUserDefaults.standardUserDefaults().doubleForKey(tueKey);
            let wednesday = NSUserDefaults.standardUserDefaults().doubleForKey(wedKey);
            let thursday = NSUserDefaults.standardUserDefaults().doubleForKey(thuKey);
            let friday = NSUserDefaults.standardUserDefaults().doubleForKey(friKey);
            
            levelTimes[0] = monday;
            levelTimes[1] = tuesday;
            levelTimes[2] = wednesday;
            levelTimes[3] = thursday;
            levelTimes[4] = friday;
            break;
        case 3:
            levelTimes = [3.0, 3.0, 3.0, 3.0, 3.0];
            break;
        default:
            levelTimes = [0.0, 0.0, 0.0, 0.0, 0.0];
            break;
        }
        return levelTimes;
    }

    @IBAction func pressedLvButton(sender: UIButton) {
        switch (sender.tag) {
        case 1:
            self.selectedLevel = 1;
            break;
        case 2:
            self.selectedLevel = 2;
            break;
        case 3:
            self.selectedLevel = 3;
            break;
        default:
            break;
        }
        
        self.times = readData(self.selectedLevel);
        setupChart(daysOfTheWeek, values: self.times);
        print("Picked Level was \(selectedLevel)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
}

