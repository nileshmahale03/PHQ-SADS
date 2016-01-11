//
//  LeftMenuTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/1/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit

class LeftMenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.separatorColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "phq9"){
            print("hello1")
            DataSource.sharedInstance.currentQuestionSet = DataSource.sharedInstance.phq9Questions
            DataSource.sharedInstance.currentAnswerSet = [Int]()
            for (var i = 0; i < DataSource.sharedInstance.currentQuestionSet?.count; i++){
                DataSource.sharedInstance.currentAnswerSet?.append(0)
            }
            let navigationController : UINavigationController = segue.destinationViewController as! UINavigationController
            
            let phq9TestViewController : PHQ_9TestViewController = navigationController.viewControllers[0] as! PHQ_9TestViewController
            phq9TestViewController.pageTitles = DataSource.sharedInstance.phq9Questions
            phq9TestViewController.title = "PHQ-9"
        }
        else if(segue.identifier == "gad7"){
            print("hello2")
            DataSource.sharedInstance.currentQuestionSet = DataSource.sharedInstance.gad7Questions
            DataSource.sharedInstance.currentAnswerSet = [Int]()
            for (var i = 0; i < DataSource.sharedInstance.currentQuestionSet?.count; i++){
                DataSource.sharedInstance.currentAnswerSet?.append(0)
            }
            
            let navigationController : UINavigationController = segue.destinationViewController as! UINavigationController
            
            let phq9TestViewController : PHQ_9TestViewController = navigationController.viewControllers[0] as! PHQ_9TestViewController
            phq9TestViewController.pageTitles = DataSource.sharedInstance.gad7Questions
            phq9TestViewController.title = "GAD-7"
        }
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
