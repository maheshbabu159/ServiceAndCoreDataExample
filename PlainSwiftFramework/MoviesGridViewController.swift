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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refreshView(){
        
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
        
        let imageView:UIImageView = cell.contentView.viewWithTag(ControlTagsEnum.CELL_MOVIE_IMAGE_VIEW.rawValue) as! UIImageView
        let nameLable:UILabel = cell.contentView.viewWithTag(ControlTagsEnum.CELL_MOVIE_NAME_LABLE.rawValue) as! UILabel
        
        if let photo:NSDictionary = object.photo as? NSDictionary{
            imageView.image = UIImage(named: photo.valueForKey("name") as! String)
        }
        nameLable.text = object.name
        

        return cell
    }
    
    
}
