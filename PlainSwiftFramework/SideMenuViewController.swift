//
//  SideMenuViewController.swift
//  CyberMoney
//
//  Created by maheshbabu.somineni on 11/9/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    
    func replaceDetailsViewController(row:NSInteger)
    func menuOptionSelected()

}
class SideMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var menuTableView: UITableView!
    @IBOutlet weak var userFirstNameLabel: UILabel!
    
    var deleagate: SideMenuViewControllerDelegate?
    
    var menuItemsArray: Array<MenuItem>!

    struct TableView {
        
        struct CellIdentifiers {
            
            static let MenuTableViewCell = "Cell"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.menuTableView.dataSource = self
        self.menuTableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:Table view delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return menuItemsArray.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //Cell object
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        tableView.backgroundColor = UIColor.whiteColor()
        cell.backgroundColor = UIColor.whiteColor()
        cell.contentView.backgroundColor = UIColor.whiteColor()

        //Set values
        let menuItem: MenuItem = menuItemsArray[indexPath.row]
        let menuImageView: UIImageView = cell.contentView.viewWithTag(1000) as! UIImageView
        let menuTitleLable: UILabel = cell.contentView.viewWithTag(1001)as! UILabel
        
        menuImageView.image = menuItem.image
        menuTitleLable.text = menuItem.title
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        deleagate?.replaceDetailsViewController(indexPath.row)
    }
    
}
class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    
    func configureForAnimal(animal: MenuItem) {
        
        animalImageView.image = animal.image
        imageNameLabel.text = animal.title
    }
    
}


