//
//  Bulletin.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/13.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

class Bulletin: UITableViewController, ComposeDelegate {
    var sectionSelected = Int()
    var titleArray1 = [String]()
    var titleArray2 = [String]()
    var timeArray1 = [String]()
    var timeArray2 = [String]()
    var contentArray1 = [String]()
    var contentArray2 = [String]()
    
    //set tableView
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return titleArray1.count
        }else{
            return titleArray2.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0{
            cell.textLabel?.text = titleArray1[indexPath.row]
        }else{
            cell.textLabel?.text = titleArray2[indexPath.row]
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "店公告"
        }else{
            return "區公告"
        }
    }

    //set delete function
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            if indexPath.section == 0{
                titleArray1.removeAtIndex(indexPath.row)
                timeArray1.removeAtIndex(indexPath.row)
                contentArray1.removeAtIndex(indexPath.row)
                NSUserDefaults.standardUserDefaults().setObject(titleArray1, forKey: "titleArray1")
                NSUserDefaults.standardUserDefaults().setObject(timeArray1, forKey: "timeArray1")
                NSUserDefaults.standardUserDefaults().setObject(contentArray1, forKey: "contentArray1")
            }else{
                titleArray2.removeAtIndex(indexPath.row)
                timeArray2.removeAtIndex(indexPath.row)
                contentArray2.removeAtIndex(indexPath.row)
                NSUserDefaults.standardUserDefaults().setObject(titleArray2, forKey: "titleArray2")
                NSUserDefaults.standardUserDefaults().setObject(timeArray2, forKey: "timeArray2")
                NSUserDefaults.standardUserDefaults().setObject(contentArray2, forKey: "contentArray2")
            }
            tableView.reloadData()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.title = "Back" //set back button
        performSegueWithIdentifier("bulletinDetail", sender: self)
    }
    
    @IBAction func composeButton(sender: UIBarButtonItem) {
        self.title = "Cancel"
        performSegueWithIdentifier("bulletinCompose", sender: nil)
    }
    

    //pass value to DetailVC
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = self.tableView.indexPathForSelectedRow

        if segue.identifier == "bulletinCompose"{
            let composeVC = segue.destinationViewController as! BulletinCompose
            composeVC.delegate = self
        }else if segue.identifier == "bulletinDetail"{
            let detailVC = segue.destinationViewController as! BulletinDetail
            detailVC.selectedSection = indexPath!.section
            detailVC.selectedRow = indexPath!.row
            detailVC.titleArray1 = titleArray1
            detailVC.titleArray2 = titleArray2
            detailVC.timeArray1 = timeArray1
            detailVC.timeArray2 = timeArray2
            detailVC.contentArray1 = contentArray1
            detailVC.contentArray2 = contentArray2
        }
    }
    
    //pass value from composeVC
    func setSection(sectionPressed: Int){
        sectionSelected = sectionPressed
    }
    
    //save input value to local arrays
    func setInputValues(inputTitle: String, inputTime: String, inputContent: String){
        
        if sectionSelected == 0{
            titleArray1.append(inputTitle)
            timeArray1.append(inputTime)
            contentArray1.append(inputContent)
            NSUserDefaults.standardUserDefaults().setObject(titleArray1, forKey: "titleArray1")
            NSUserDefaults.standardUserDefaults().setObject(timeArray1, forKey: "timeArray1")
            NSUserDefaults.standardUserDefaults().setObject(contentArray1, forKey: "contentArray1")
        }else{
            titleArray2.append(inputTitle)
            timeArray2.append(inputTime)
            contentArray2.append(inputContent)
            NSUserDefaults.standardUserDefaults().setObject(titleArray2, forKey: "titleArray2")
            NSUserDefaults.standardUserDefaults().setObject(timeArray2, forKey: "timeArray2")
            NSUserDefaults.standardUserDefaults().setObject(contentArray2, forKey: "contentArray2")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //give array the value took out from NSUserDefaults
        if NSUserDefaults.standardUserDefaults().objectForKey("titleArray1") != nil{
            titleArray1 = NSUserDefaults.standardUserDefaults().objectForKey("titleArray1") as! Array
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("titleArray2") != nil{
            titleArray2 = NSUserDefaults.standardUserDefaults().objectForKey("titleArray2") as! Array
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("timeArray1") != nil{
            timeArray1 = NSUserDefaults.standardUserDefaults().objectForKey("timeArray1") as! Array
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("timeArray2") != nil{
            timeArray2 = NSUserDefaults.standardUserDefaults().objectForKey("timeArray2") as! Array
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("contentArray1") != nil{
            contentArray1 = NSUserDefaults.standardUserDefaults().objectForKey("contentArray1") as! Array
        }
        if NSUserDefaults.standardUserDefaults().objectForKey("contentArray2") != nil{
            contentArray2 = NSUserDefaults.standardUserDefaults().objectForKey("contentArray2") as! Array
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "公告欄"
        self.tabBarController?.tabBar.hidden = false
        tableView.reloadData()
        
    }

    
    


}
