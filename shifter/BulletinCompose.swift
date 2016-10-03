//
//  BulletinCompose.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/25.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

protocol ComposeDelegate{
    func setSection(sectionPressed: Int)
    func setInputValues(inputTitle: String, inputTime: String, inputContent: String)
}

class BulletinCompose: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var delegate: ComposeDelegate! = nil
    let subjectArray = ["標題：","時間：","內容：","種類："]
    var inputTitle = ""
    var inputTime = ""
    var inputContent = ""
    var indexPath1 = NSIndexPath()
    var indexPath2 = NSIndexPath()
    var indexPath3 = NSIndexPath()
    var sectionPressed = Int()

    
    @IBOutlet weak var tableView: UITableView!
    
    //set tableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCellWithIdentifier("textInputCell") as? TextInputTableViewCell
        let subjectLabel = UILabel(frame: CGRectMake(20,10,51,21))
        cell?.addSubview(subjectLabel)
        subjectLabel.text = subjectArray[indexPath.row]
        indexPath1 = NSIndexPath(forRow: 0, inSection: 0)
        indexPath2 = NSIndexPath(forRow: 1, inSection: 0)
        indexPath3 = NSIndexPath(forRow: 2, inSection: 0)
        
        if indexPath.row == 0{
            cell!.configure(text: inputTitle, placeholder: "title")
            cell!.textInput.delegate = self
            cell?.textInput.becomeFirstResponder()
        }else if indexPath.row == 1{
            cell!.configure(text: inputTime, placeholder: "time")
            cell!.textInput.delegate = self
        }else if indexPath.row == 2{
            cell!.configure(text: inputContent, placeholder: "content")
            cell!.textInput.delegate = self
        }else{
            cell?.configure(text: "", placeholder: "")
            
            //add buttons
            let type1Button = UIButton(frame: CGRect(x: 70,y: 8,width: 46,height: 30))
            type1Button.setTitle("店", forState: .Normal)
            type1Button.setTitleColor(.blackColor(), forState: .Normal)
            type1Button.setTitleColor(UIColor.blueColor() , forState: .Selected)
            type1Button.tag = 1
            type1Button.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
            cell!.contentView.addSubview(type1Button)
            
            let type2Button = UIButton(frame: CGRect(x: 140,y: 8,width: 46,height: 30))
            type2Button.setTitle("區", forState: .Normal)
            type2Button.setTitleColor(.blackColor(), forState: .Normal)
            type2Button.tag = 2
            type2Button.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
            cell!.contentView.addSubview(type2Button)
            
            if sectionPressed == 0{
                type1Button.backgroundColor = .grayColor()
                type2Button.backgroundColor = .whiteColor()
            }else{
                type1Button.backgroundColor = .whiteColor()
                type2Button.backgroundColor = .grayColor()
            }
            
        }

        return cell!
    }
    
    //save value when value change
    func saveInputText1(){
        let cell = tableView.cellForRowAtIndexPath(indexPath1) as! TextInputTableViewCell
        inputTitle = cell.textInput.text!
    }
    func saveInputText2(){
        let cell = tableView.cellForRowAtIndexPath(indexPath2) as! TextInputTableViewCell
        inputTime = cell.textInput.text!
    }
    func saveInputText3(){
        let cell = tableView.cellForRowAtIndexPath(indexPath3) as! TextInputTableViewCell
        inputContent = cell.textInput.text!

    }
    
    //save value when texxtfield's value changed
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        saveInputText1()
        saveInputText2()
        saveInputText3()
        print(inputTitle)
        print(inputTime)
        print(inputContent)
        return true
    }
    
    //choose section
    func buttonAction(sender:UIButton){
        if sender.tag == 1{
            sectionPressed = 0
            print("button 1 tapped")
        }else{
            sectionPressed = 1
            print("button 2 tapped")
        }
        
        //pass section selected
        delegate.setSection(sectionPressed)
        
        //update to latest value in textfield
        saveInputText1()
        saveInputText2()
        saveInputText3()
        tableView.reloadData()
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {  //press return
        textField.resignFirstResponder()
        return true
    }

    func buttonMethod(){ //clicked done

        //update to latest value in textfield
        saveInputText1()
        saveInputText2()
        saveInputText3()
        print(inputTitle)
        print(inputTime)
        print(inputContent)
        
        //pass value
        delegate.setInputValues(inputTitle, inputTime: inputTime, inputContent: inputContent)
        
        //go back to bulletin(from navigation)
        let bulletinNavigationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("bulletinNavigationVC")
        self.presentViewController(bulletinNavigationVC, animated: true, completion: nil)
       
        
    }
    
    
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
    
    override func viewWillAppear(animated: Bool) {
        sectionPressed = 0
        self.tabBarController?.tabBar.hidden = true
    }
    
    
}









