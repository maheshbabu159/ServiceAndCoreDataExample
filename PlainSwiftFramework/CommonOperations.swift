//
//  CommonOperations.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/11/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import UIKit
import CoreData

class CommonOperations: NSObject {

  
    class func fetchAllObjects(entityName:String, context:NSManagedObjectContext) -> NSArray {
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName(entityName, inManagedObjectContext: context)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        
        do {
            
            let result = try context.executeFetchRequest(fetchRequest)
            return result
            
        } catch {
            
            print(error as NSError)
            return NSArray()
        }
    }
}
