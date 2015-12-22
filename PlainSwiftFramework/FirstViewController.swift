//
//  FirstViewController.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit
import CoreData

class FirstViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        super.showMenuButton()
        
        let parameters = ["method":GlobalVariables.RequestAPIMethods.getComments.rawValue,"movieId":"lQl9OfB40U"]
        
        super.showProgress()
        NetworkManager.postRequest(parameters, delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK:Service data handler
    override func dataDelegate(reponseData: AnyObject, requestMethod:GlobalVariables.RequestAPIMethods) {
        super.dataDelegate(reponseData, requestMethod: requestMethod)
        
        switch requestMethod{
            
        case .getComments:
            
            if let rootDictionary = reponseData as? [String:AnyObject]{
            
                if let resultArray:[AnyObject] = rootDictionary["result"] as? [AnyObject]{
                    
                    //Remove all objects
                    ReviewOrComment.truncateAllObjects(self.appDelegate.managedObjectContext)
                    
                    //Insert all records
                    for dictionary in resultArray{
                        
                        ReviewOrComment.insertObject(dictionary, context: self.appDelegate.managedObjectContext)
                        
                    }
                    

                    //Show the result count
                    let array:NSArray = ReviewOrComment.fetchAllObjects(self.appDelegate.managedObjectContext)
                    print(array.count)
                }
            }

            break
    
        default:
            print("")
        }
    }

}
