//
//  MoviesContainerViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

enum SegmentEnum:Int{
    case UpComing = 0
    case Released = 1
}
enum DataViewEnum:Int{
    case List = 0
    case Grid = 1
}
class MoviesContainerViewController: BaseViewController {

    @IBOutlet var tableContainerView:UIView!
    @IBOutlet var gridContainerView:UIView!
    var moviesTableViewControllerDelegate:MoviesTableViewController!
    var moviesGridViewControllerDelegate:MoviesGridViewController!
    var selectedSegmentIndex:Int = 0

    //MARK:Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.getMoviesByIndustryServiceCall("Tollywood")
        
        self.setDefaultView()
    }
    func setDefaultView(){
        
        if(GlobalSettings.isGridView()){
            self.gridContainerView.hidden = false
            self.tableContainerView.hidden = true
            self.moviesGridViewControllerDelegate.refreshView()

        }else{
            self.gridContainerView.hidden = true
            self.tableContainerView.hidden = false
            self.moviesTableViewControllerDelegate.refreshView()

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "tableEmbedSegue"){
            self.moviesTableViewControllerDelegate = segue.destinationViewController as! MoviesTableViewController
            self.moviesTableViewControllerDelegate.parentDelegate = self
        }
        if(segue.identifier == "gridEmbedSegue"){
            self.moviesGridViewControllerDelegate = segue.destinationViewController as! MoviesGridViewController
            self.moviesGridViewControllerDelegate.parentDelegate = self
        }
    }
    func refreshView(){
        
        //Show the result count
        if(selectedSegmentIndex == DataViewEnum.List.rawValue){
            self.moviesTableViewControllerDelegate.refreshView()
        }else{
            self.moviesGridViewControllerDelegate.refreshView()
        }

    }
    // MARK: - Button click methods
    @IBAction func gridButtonClick(sender:AnyObject){
        
        if(GlobalSettings.isGridView()){
            GlobalSettings.setGridView(false)
        }else{
            GlobalSettings.setGridView(true)
        }
        self.setDefaultView()
    }
    @IBAction func segmentValueChanged(sender:AnyObject){
        let segmentControll:UISegmentedControl = sender as! UISegmentedControl
        self.selectedSegmentIndex  = segmentControll.selectedSegmentIndex
        self.refreshView()
    }
    @IBAction func searchButtonClick(sender:AnyObject){
        self.getMoviesByIndustryServiceCall("All")
    }
    //MARK:Service Calls
    func getMoviesByIndustryServiceCall(aIndustry:String){
        
        let paramsDictionary:[String:String] = ["method": "getMoviesByIndustry","industry":"Tollywood"]
        super.showProgress()
        NetworkManager.postRequest(paramsDictionary, delegate: self)
    }
    //MARK:Service data handler
    override func dataDelegate(reponseData: AnyObject, requestMethod:GlobalVariables.RequestAPIMethods) {
        super.dataDelegate(reponseData, requestMethod: requestMethod)
        
        switch requestMethod{
        case .getMoviesByIndustry:
            if let rootDictionary = reponseData as? [String:AnyObject]{
                if let resultArray:[AnyObject] = rootDictionary["result"] as? [AnyObject]{
                    //Remove all objects
                    //MoviesModel.truncateAllObjects(super.appDelegate.managedObjectContext)
                    //Insert all records
                    for dictionary in resultArray{
                        MoviesModel.insertObject(dictionary, context:self.appDelegate.managedObjectContext)
                    }
                    //Refresh the data
                    self.refreshView()
                }
            }
            break
        default:
            print("")
        }
    }

}
