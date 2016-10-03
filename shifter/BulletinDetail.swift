//
//  BulletinDetail.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/21.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit


class BulletinDetail: UITableViewController {
    let subjectArray = ["標題：","時間：","內容"]
    var selectedSection = Int()
    var selectedRow = Int()
    var titleArray1 = [String]()
    var titleArray2 = [String]()
    var timeArray1 = [String]()
    var timeArray2 = [String]()
    var contentArray1 = [String]()
    var contentArray2 = [String]()
    
    //set tableView
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("bulletinDetailCell")! as UITableViewCell
        let subjectLabel = UILabel(frame: CGRectMake(20,10,51,21))
        
        //set subject and content labels
        cell.addSubview(subjectLabel)
        subjectLabel.text = subjectArray[indexPath.row]
        let valueLabel = UILabel(frame: CGRectMake(60,10,400,21))
        cell.addSubview(valueLabel)

        if indexPath.row == 0 {
            if selectedSection == 0{
                valueLabel.text = titleArray1[selectedRow]
            }else{
                valueLabel.text = titleArray2[selectedRow]
            }
        }else if indexPath.row == 1 {
            if selectedSection == 0{
                valueLabel.text = timeArray1[selectedRow]
            }else{
                valueLabel.text = timeArray2[selectedRow]
            }
        }else{
            if selectedSection == 0{
                valueLabel.text = contentArray1[selectedRow]
            }else{
                valueLabel.text = contentArray2[selectedRow]
            }
        }
        
        return cell
    }
   
    override func viewDidLoad() {
        self.tabBarController?.tabBar.hidden = true
    }
    
}

