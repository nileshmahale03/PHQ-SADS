//
//  MasterHistoryTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 2/4/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData

class MasterHistoryTableViewController: UITableViewController {
    
    var managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var history = [History] ()
    var dates = [String] ()
    var scoresString: [String] = [String] ()
    var scores: [Double] = [Double] ()
    var test: String = ""
    
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add title
        self.navigationItem.title = "History"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont(name: "avenir next condensed", size: 21)!]
        
        // When the menu button is tapped, it will call the revealToggle: method to display the left-sidebar menu & when the organize button is tapped, it will call the revealToggle: method to display the right-sidebar menu.
        
        if revealViewController() != nil {
            revealViewController().rearViewRevealWidth = 250
            menuBarButton.target = revealViewController()
            menuBarButton.action = "revealToggle:"
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = "rightRevealToggle:"
            
            // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if (segue.identifier == "phq-9") {
            coreDataPredicateResultsFor("PHQ-9")
        } else if (segue.identifier == "gad-7") {
            coreDataPredicateResultsFor("GAD-7")
        } else if (segue.identifier == "phq-15") {
            coreDataPredicateResultsFor("PHQ-15")
        } else if (segue.identifier == "panicSymptoms") {
            coreDataPredicateResultsFor("Panic Symptoms")
        }
        
        if let destinationViewController = segue.destinationViewController as? HistoryBarChartViewController {
            destinationViewController.history = history
            destinationViewController.dates = dates
            destinationViewController.scores = scores
            destinationViewController.test = test
            destinationViewController.title = test
        }
    }
    
    func coreDataPredicateResultsFor(filter: String) {
        let filter = filter
        let predicate = NSPredicate(format: "test = %@", filter)
        let fetchRequest = NSFetchRequest(entityName: "History")
        fetchRequest.predicate = predicate
        
        test = filter
        
        do {
            scoresString.removeAll()
            scores.removeAll()
            dates.removeAll()
            
            if let results = try managedObjectContext.executeFetchRequest(fetchRequest) as? [History] {
                for result in results {
                    if let score = result.valueForKey("score") as? String, date = result.valueForKey("date") as? String {
                        scoresString.append(score)
                        scores = scoresString.map{ Double($0) ?? 0 }
                        dates.append(formatDate(date))
                    }
                }
                history = results
            }
        } catch {
            print("There was a fetch error!")
        }
    }
    
    func formatDate(date: String) -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        let modifiedDate = dateFormatter.dateFromString(date)
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        let convertedDate = dateFormatter.stringFromDate(modifiedDate!)
        
        return convertedDate
    }

    
    
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



}
