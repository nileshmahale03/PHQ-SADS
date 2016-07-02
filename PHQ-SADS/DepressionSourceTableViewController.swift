//
//  DepressionSourceTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 2/15/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//              

import UIKit

class DepressionSourceTableViewController: UITableViewController {
    
    var depressionSourceName: [String] = ["Mental Health America"
                                        , "Mayo Clinic"
                                        , "WebMD"
                                        , "National Institute of Mental Health"]
    var depressionSourceURL: [String] = ["http://www.mentalhealthamerica.net/conditions/depression"
                                        , "http://www.mayoclinic.org/diseases-conditions/depression/basics/definition/con-20032977"
                                        , "http://www.m.webmd.com/depression/default.htm"
                                        , "http://www.nimh.nih.gov/health/topics/depression/index.shtml"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.navigationItem.title = "Sources"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        self.tableView.separatorColor = UIColor.clearColor()
        self.tableView.allowsSelection = true
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return depressionSourceName.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = depressionSourceName[indexPath.row]
        
        cell.textLabel?.font = UIFont(name: "avenir next condensed", size: 21)
        
        cell.textLabel?.textColor = UIColor(colorLiteralRed: 76.0/255.0, green: 175.0/255.0, blue: 80.0/255.0, alpha: 1)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("Selected \(indexPath.row)")
        UIApplication.sharedApplication().openURL(NSURL(string: depressionSourceURL[indexPath.row])!)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
