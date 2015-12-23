//
//  MoviesTableViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

protocol ContainerViewControllerProtocol {
    func someDelegateMethod()
}
enum ControlTagsEnum:Int{
    
    case CELL_MOVIE_IMAGE_VIEW = 1000
    case CELL_MOVIE_NAME_LABLE = 1001

}
class MoviesTableViewController: BaseViewController {
    @IBOutlet var moviesTableView:UITableView!
    var parentDelegate: MoviesContainerViewController!
    var array:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        super.showMenuButton()
        self.array = NSArray()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshView(){
        
        self.array = MoviesModel.fetchAllObjects(super.appDelegate.managedObjectContext)
        self.moviesTableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MoviesTableViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        
        //Set the values
        let object:MoviesModel = self.array.objectAtIndex(indexPath.row) as! MoviesModel
        
        let imageView:UIImageView = cell.contentView.viewWithTag(ControlTagsEnum.CELL_MOVIE_IMAGE_VIEW.rawValue) as! UIImageView
        let nameLable:UILabel = cell.contentView.viewWithTag(ControlTagsEnum.CELL_MOVIE_NAME_LABLE.rawValue) as! UILabel
        
        if let photo:NSDictionary = object.photo as? NSDictionary{

            GlobalSettings.downloadImageFrom(photo.valueForKey("url") as! String, contentMode:  UIViewContentMode.ScaleAspectFit, imageView: imageView)
        }
        nameLable.text = object.name
        
        return cell as UITableViewCell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
}