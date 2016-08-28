//
//  Bulletin.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/13.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

var bulletinTitleArray1 = ["買一送一，大夥加油！"]
var bulletinTitleArray2 = ["明天（星期一）將有買一送一活動"]
var bulletinTimeArray = ["2016/8/14 AM 11:00","2016/8/21 AM 11:00"]
var bulletinContentArray = ["如題","如題"]
var sectionSelected = 0


class Bulletin: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "公告欄"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0{
            cell.textLabel?.text = bulletinTitleArray1[indexPath.row]
        }else{
            cell.textLabel?.text = bulletinTitleArray2[indexPath.row]
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

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let bulletinDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("bulletinDetail")
        self.navigationController?.pushViewController(bulletinDetailVC, animated: true)
        sectionSelected = indexPath.section
        self.title = "Back" //set back button
        
    }
    
    @IBAction func composeButton(sender: UIBarButtonItem) {
        self.title = "Cancel"
        performSegueWithIdentifier("bulletinCompose", sender: nil)
    }
    
    


}
