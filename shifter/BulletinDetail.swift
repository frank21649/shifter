//
//  BulletinDetail.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/21.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

class BulletinDetail: UITableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinTitleCell")
            if sectionSelected == 0{
                cell.textLabel?.text = bulletinTitleArray1[0]
            }else{
                cell.textLabel?.text = bulletinTitleArray2[0]
            }
            return cell
        }else if indexPath.row == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinTimeCell")
            cell.textLabel?.text = bulletinTimeArray[0]
            return cell
        }else {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinContentCell")
            cell.textLabel?.text = bulletinContentArray[0]
            return cell
        }
    }
    
}

