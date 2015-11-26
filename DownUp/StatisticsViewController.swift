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
    
    var daysOfTheWeek: [String] = ["Lunes", "Martes", "Miércoles", "Jueves", "Viernes"];
    var times: [Double] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        times = readData(2);
        setupChart(daysOfTheWeek, values: times);
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
        let levelTimes = [1.0, 2.0, 3.0, 4.0, 5.0];
        return levelTimes;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }
}

