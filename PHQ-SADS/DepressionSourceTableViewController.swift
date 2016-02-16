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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        print("Selected \(indexPath.row)")
        UIApplication.sharedApplication().openURL(NSURL(string: depressionSourceURL[indexPath.row])!)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
