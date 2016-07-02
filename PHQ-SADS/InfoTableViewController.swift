//
//  InfoTableViewController.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 2/7/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//

import UIKit
import MessageUI
import SWRevealViewController

class InfoTableViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    @IBOutlet weak var organizeBarButton: UIBarButtonItem!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add title
        self.navigationItem.title = "Info"
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

        return 3
    }
    
    // MARK: - Share Button Action
    @IBAction func shareButtonAction(sender: UIButton) {
        //print("Share button clicked !")
        displayShareSheet("Check out PHQ-SADS - an app for self-administering screening and diagnostic of mental health disorders")
    }

    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
        return
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
    
    // MARK: - Send Feedback Button Action
    @IBAction func sendFeedbackButtonAction(sender: UIButton) {
        //print("Send Feedbcak Button clicked")
        showEmail()
    }
    
    
    func showEmail() {
        // make sure your device can send an email 
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let emailTitle = "Feedback"
        let messageBody = "Great App"
        let toRecipients = ["code-programming@outlook.com"]
        
        //Initialize the mail composer and populate the mail content
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        mailComposer.setSubject(emailTitle)
        mailComposer.setMessageBody(messageBody, isHTML: false)
        mailComposer.setToRecipients(toRecipients)
        
        // Present mail view controller on screen
        presentViewController(mailComposer, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultCancelled.rawValue:
            print("Mail cancelled")
        case MFMailComposeResultSaved.rawValue:
            print("Mail saved")
        case MFMailComposeResultSent.rawValue:
            print("Mail sent")
        case MFMailComposeResultFailed.rawValue:
            print("Failed to send: \(error)")
        default:
            break
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
