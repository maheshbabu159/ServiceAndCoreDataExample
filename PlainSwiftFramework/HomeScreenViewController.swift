//
//  HomeScreenViewController.swift
//  DbDemoExampleSwift
//
//  Created by TheAppGuruz-New-6 on 11/08/15.
//  Copyright (c) 2015 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class HomeScreenViewController: BaseViewController , UITableViewDataSource,UITableViewDelegate {
    
    var marrStudentData : NSMutableArray!
    @IBOutlet weak var tbStudentData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.getStudentData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Other methods
    
    func getStudentData()
    {
        marrStudentData = NSMutableArray()
        marrStudentData = StudentModel.getInstance().getAllStudentData()
        tbStudentData.reloadData()
    }
    
    //MARK: UITableView delegate methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marrStudentData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")!
       // _:StudentInfo = marrStudentData.objectAtIndex(indexPath.row) as! StudentInfo
        
        return cell
    }
    
    //MARK: UIButton Action methods

    @IBAction func btnDeleteClicked(sender: AnyObject) {
        let btnDelete : UIButton = sender as! UIButton
        let selectedIndex : Int = btnDelete.tag
        let studentInfo: StudentInfo = marrStudentData.objectAtIndex(selectedIndex) as! StudentInfo
        let isDeleted = StudentModel.getInstance().deleteStudentData(studentInfo)
        if isDeleted {
            //su.invokeAlertMethod("", strBody: "Record deleted successfully.", delegate: nil)
        } else {
            //Util.invokeAlertMethod("", strBody: "Error in deleting record.", delegate: nil)
        }
        self.getStudentData()
    }

    @IBAction func btnEditClicked(sender: AnyObject)
    {
        self.performSegueWithIdentifier("editSegue", sender: sender)
    }
    
    //MARK: Navigation methods

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "editSegue")
        {
            let btnEdit : UIButton = sender as! UIButton
            let selectedIndex : Int = btnEdit.tag
            let viewController : InsertRecordViewController = segue.destinationViewController as! InsertRecordViewController
            viewController.isEdit = true
            viewController.studentData = marrStudentData.objectAtIndex(selectedIndex) as! StudentInfo
        }
    }

}
