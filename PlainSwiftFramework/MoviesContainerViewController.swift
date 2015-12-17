//
//  MoviesContainerViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

class MoviesContainerViewController: BaseViewController {

    @IBOutlet var tableContainerView:UIView!
    @IBOutlet var gridContainerView:UIView!

    var moviesTableViewControllerDelegate:MoviesTableViewController!
    var moviesGridViewControllerDelegate:MoviesGridViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            
            moviesTableViewControllerDelegate = segue.destinationViewController as! MoviesTableViewController
            moviesTableViewControllerDelegate.parentDelegate = self

        }
        if(segue.identifier == "gridEmbedSegue"){
            
            moviesGridViewControllerDelegate = segue.destinationViewController as! MoviesGridViewController
            moviesGridViewControllerDelegate.parentDelegate = self
        }
        
    }
    
    
    //MARK:Button click methods
    @IBAction func gridButtonClick(){
        
        
    }
    @IBAction func segmentValueChanged(){
        
        
    }
    
    //MARK:Service Calls
    func getMoviesByIndustryServiceCall(aIndustry:String){
        
        
    }
    
    
}
