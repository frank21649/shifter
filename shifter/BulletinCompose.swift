//
//  BulletinCompose.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/25.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

class BulletinCompose: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "新增公告"
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "buttonMethod")
        navigationItem.rightBarButtonItem = doneButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonMethod(){ //clicked done
        print("clicked done")
    }
    
    
/*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = "test"
//        return cell
        if indexPath.row == 0{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinTitleCell") as? TextInputTableViewCell
            cell?.configure("主旨：", placeHolder: "")
//            cell.textLabel?.text = "主旨："
            return cell!
        }else if indexPath.row == 1{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinTimeCell")
            cell.textLabel?.text = "時間："
            return cell
        }else{
            let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "bulletinContentCell")
            cell.textLabel?.text = "內容："
            return cell
        }
        
    }
*/
   
}

/*
class TextInputTableViewCell: UITableViewCell {
    @IBOutlet weak var textInputCell: UITextField!
    
    func configure(text:String, placeHolder:String){
        let text = textInputCell.text
        let placeHolder = textInputCell.placeholder
        
        textInputCell.accessibilityValue = text
        textInputCell.accessibilityLabel = placeHolder
    }
    
}
*/






