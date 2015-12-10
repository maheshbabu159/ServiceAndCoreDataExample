//
//  FirstViewController.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let parameters = ["metdhod": "getComments","movieId":"lQl9OfB40U"]
        
        NetworkManager.postRequest(parameters, requestMethod: GlobalVariables.RequestAPIMethods.getStudets, delegate: self)
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

}
