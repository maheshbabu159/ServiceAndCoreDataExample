//
//  MoviesGridViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

class MoviesGridViewController: BaseViewController {
    @IBOutlet var moviesCollectionView:UICollectionView!
    var parentDelegate: MoviesContainerViewController!
    var array:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.moviesCollectionView.backgroundColor = UIColor.whiteColor()
        self.array = NSArray()
        
        self.setCollectionViewLayout()
    }

    func setCollectionViewLayout(){
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 90, height: 90)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        self.moviesCollectionView.setCollectionViewLayout(layout, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshView(){
        
        self.array = MoviesModel.fetchAllObjects(super.appDelegate.managedObjectContext)
        self.moviesCollectionView.reloadData()
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
extension MoviesGridViewController:UICollectionViewDataSource,UICollectionViewDelegate{

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.array.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        //Set the values
        let object:MoviesModel = self.array.objectAtIndex(indexPath.row) as! MoviesModel
        
        let imageView:UIImageView = cell.viewWithTag(ControlTagsEnum.CELL_MOVIE_IMAGE_VIEW.rawValue) as! UIImageView
        let nameLable:UILabel = cell.viewWithTag(ControlTagsEnum.CELL_MOVIE_NAME_LABLE.rawValue) as! UILabel
        
        if let photo:NSDictionary = object.photo as? NSDictionary{
            
            GlobalSettings.downloadImageFrom(photo.valueForKey("url") as! String, contentMode:  UIViewContentMode.ScaleAspectFit, imageView: imageView)
        }
        nameLable.text = object.name

        return cell
    }
    
    
}
