//
//  Movies.swift
//  
//
//  Created by maheshbabu.somineni on 12/10/15.
//
//

import Foundation
import CoreData

class Movies: NSManagedObject {

    // Insert code here to add functionality to your managed object subclass
    class func addObject(context:NSManagedObjectContext) {
        
       
        
    }
    class func deleteObject() {
        
        
    }
    class func updateObject() {
        
        
    }
    class func truncateAllObject() {
        
        
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.Movies.rawValue as String, context: context)
        
        return resultArray
    }
}
