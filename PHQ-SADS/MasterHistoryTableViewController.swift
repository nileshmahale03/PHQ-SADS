//
//  MasterHistoryTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 2/4/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import CoreData
import SWRevealViewController

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
            revealViewController().rearViewRevealWidth = 200
            menuBarButton.target = revealViewController()
            menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            revealViewController().rightViewRevealWidth = 150
            organizeBarButton.target = revealViewController()
            organizeBarButton.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            
            // User can swipe the content area to activate the sidebar as well
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            self.tableView.separatorColor = UIColor.clearColor()
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    // MARK: - Navigation
    
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

}
