//
//  HistoryTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/23/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData

class HistoryTableViewController: UITableViewController {

    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var history = [History] ()
    
    var histories:[History1] = [
        History1(date: "1/20/2016", test: "PHQ-9", score: "3/27"),
        History1(date: "1/21/2016", test: "PHQ-15", score: "5/27"),
        History1(date: "1/22/2016", test: "GAD-7", score: "21/27"),
        History1(date: "1/23/2016", test: "Panic Symptoms", score: "7/27"),
        History1(date: "1/24/2016", test: "PHQ-9", score: "9/27"),
        History1(date: "1/25/2016", test: "PHQ-15", score: "13/27"),
    ]
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData()
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func reloadData() {

        let fetchRequest = NSFetchRequest(entityName: "History")
        
        do {
            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [History] {
                history = results
            }
        } catch {
            fatalError("There was an error fetching a list of POI's")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.navigationItem.title = "History"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        // When the menu button is tapped, it will call the revealToggle: method to display the left-sidebar menu & when the organize button is tapped, it will call the revealToggle: method to display the right-sidebar menu.
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 200
            menuBarButton.target = revealViewController()
            menuBarButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = "rightRevealToggle:"
            
            // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
//    override func viewDidAppear(animated: Bool) {
//        
//        let fetchRequest = NSFetchRequest(entityName: "History")
//        
//        do {
//            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [NSManagedObject] {
//                for result in results {
//                    if let test = result.valueForKey("test") as? String, score = result.valueForKey("score") as? String, date = result.valueForKey("date") as? String {
//                        print("Got \(test) \(score) \(date)")
//                    }
//                }
//            }
//        } catch {
//            print("There was a fetch error!")
//        }
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return self.histories.count
        return history.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as! HistoryTableViewCell

        // Configure the cell...
//        let history = histories[indexPath.row]
//        cell.dateLabel.text = history.date
//        cell.testLabel.text = history.test
//        cell.scoreLabel.text = history.score

        let someHistory = history[indexPath.row]
        
        cell.dateLabel.text = someHistory.date
        cell.testLabel.text = someHistory.test
        cell.scoreLabel.text = someHistory.score
        
        return cell
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
