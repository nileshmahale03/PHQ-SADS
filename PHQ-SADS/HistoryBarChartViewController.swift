//
//  HistoryBarChartViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 2/5/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData
import Charts

class HistoryBarChartViewController: UIViewController {
    
    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var history = [History] ()
    var dates: [String] = [String] ()
    var scores: [Double] = [Double] ()
    var test: String = ""
    
    
    @IBOutlet weak var barChartView: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        if (dates.count == 0 && scores.count == 0) {
            
            barChartView.noDataText = "Your Historical scores of the result will appear here."
            barChartView.noDataTextDescription = "Please take a test."
            
        } else if (dates.count >= 1 || scores.count >= 1) {
            
            setChart(dates, values: scores)
        }
        
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [BarChartDataEntry] = [BarChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }
        
        let chartDataSet = BarChartDataSet(yVals: dataEntries, label: "scores")
        chartDataSet.colors = ChartColorTemplates.vordiplom()
        //chartDataSet.colors = [UIColor(red: 231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 1)]
        let chartData = BarChartData(xVals: dates, dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.descriptionText = test
        barChartView.backgroundColor = UIColor(red: 240.0/255.0, green: 242.0/255.0, blue: 243.0/255.0, alpha: 1)
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInBounce)
        
    }
    

    @IBAction func saveChart(sender: UIBarButtonItem) {
        //print("saving chart to camera roll")
        barChartView.saveToCameraRoll()
    }
    
}
