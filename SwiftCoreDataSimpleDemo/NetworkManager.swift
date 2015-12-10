//
//  NetworkManager.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {

    
    class func postRequest(parameters:[String:AnyObject], requestMethod:GlobalVariables.RequestAPIMethods, delegate:CMNetworkDelegate) {
        
        
        let url = NSURL(string: GlobalVariables.request_url)
        let request = NSMutableURLRequest(URL:url!)
        
        //Parse header filed values
        request.setValue(GlobalVariables.request_content_type_value, forHTTPHeaderField: GlobalVariables.request_content_type_key)
        request.setValue(GlobalVariables.x_parse_application_id_value, forHTTPHeaderField: GlobalVariables.x_parse_application_id_key)
        request.setValue(GlobalVariables.x_parse_rest_api_value, forHTTPHeaderField: GlobalVariables.x_parse_rest_api_key)
        
        request.HTTPMethod = "POST"
        request.HTTPBody = NetworkManager.encodeParameters(parameters)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            //Connection failed case
            if error != nil {
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    if error!.domain == NSURLErrorDomain && error!.code == NSURLErrorNotConnectedToInternet {
                        
                        delegate.networkError("Not connected to Internet!!")
                        
                    }else{
                        
                        delegate.networkError("Cannot connect to server!!")
                    }
                })
                
            }else{
                
                
                do{
                    let jsonResult: AnyObject = (try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers))
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        //TODO:Change parameter to request method enum
                        delegate.dataDelegate(jsonResult, sourceType:requestMethod)
                    })
                }catch{
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        
                        delegate.networkError("Cannot load data from server!!")
                    })
                }

            }
            
        
        }
        task.resume()
    }
    
    //Convert dictionary to json
    class func encodeParameters(parameters: [String : AnyObject]) -> NSData {
        
        do {
            
            //Conver dictionary to data
            let data = try NSJSONSerialization.dataWithJSONObject(parameters, options: NSJSONWritingOptions.PrettyPrinted)
            
            return data
            
        } catch let error as NSError {
            
            //Return empty object
            print(error)
            
            return NSData()
        }

    }
}
