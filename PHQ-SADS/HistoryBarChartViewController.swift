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
    
    
    @IBOutlet weak var barChartView: BarChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        //chartDataSet.colors = [UIColor(red: 231.0/255.0, green: 95.0/255.0, blue: 53.0/255.0, alpha: 1)]
        let chartData = BarChartData(xVals: dates, dataSet: chartDataSet)
        barChartView.data = chartData
        
        barChartView.backgroundColor = UIColor(red: 240.0/255.0, green: 242.0/255.0, blue: 243.0/255.0, alpha: 1)
        barChartView.xAxis.labelPosition = .Bottom
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
