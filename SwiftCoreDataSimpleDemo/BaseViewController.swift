//
//  BaseViewController.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, CMNetworkDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    func showAlertView(alertTitle: String, alertMsg: String){
        
        let alertController = UIAlertController(title: alertTitle, message: alertMsg, preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    //MARK:Service delegate methods
    func dataDelegate(dataValue:AnyObject, sourceType:GlobalVariables.RequestAPIMethods){
        print("data dict:\(dataValue)")
    }
    func networkError(errorStr:String){
        
        self.showAlertView(GlobalVariables.appName, alertMsg: errorStr)
    }


}
