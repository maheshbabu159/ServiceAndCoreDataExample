//
//  MoviesGridViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit
import AVFoundation

class MoviesGridViewController: BaseViewController {
    @IBOutlet var moviesCollectionView:UICollectionView!
    var parentDelegate: MoviesContainerViewController!
    var array:NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.moviesCollectionView.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = true

        self.array = NSArray()
        
        self.setCollectionViewLayout()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func setCollectionViewLayout(){
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        
        if let layout = self.moviesCollectionView.collectionViewLayout as? PinterestLayout{
            
            layout.delegate = self
        }
        // Set the PinterestLayout delegate
        
        self.moviesCollectionView!.backgroundColor = UIColor.clearColor()
        self.moviesCollectionView!.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
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
    func heightForComment(font: UIFont, width: CGFloat, comment:String) -> CGFloat {
        let rect = NSString(string: comment).boundingRectWithSize(CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height)
    }

}
extension MoviesGridViewController:PinterestLayoutDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.array.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
       
        let cell:AnnotatedPhotoCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! AnnotatedPhotoCell
        
        cell.roundedView.layer.cornerRadius = 4
        cell.roundedView.layer.masksToBounds = 4 > 0
        
        
        //Set the values
        let object:MoviesModel = self.array.objectAtIndex(indexPath.row) as! MoviesModel
        
        
        if let photo:NSDictionary = object.photo as? NSDictionary{
            
            GlobalSettings.downloadImageFrom(photo.valueForKey("url") as! String, contentMode:  UIViewContentMode.ScaleAspectFit, imageView: cell.imageView)
        }
        cell.captionLabel.text = object.name
        cell.commentLabel.text = object.descrption
        
        return cell
    }
    // 1. Returns the photo height
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath , withWidth width:CGFloat) -> CGFloat {
        
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRectWithAspectRatioInsideRect(CGSize(width: 200, height: 100), boundingRect)
        return rect.size.height
    }
    
    // 2. Returns the annotation size based on the text
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        
        //Set the values
        let object:MoviesModel = self.array.objectAtIndex(indexPath.row) as! MoviesModel
        
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(10)
        
        let font = UIFont(name: "AvenirNext-Regular", size: 10)!
        let commentHeight = self.heightForComment(font, width: width, comment: object.descrption!)
        let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
        return height
    }

    
}
