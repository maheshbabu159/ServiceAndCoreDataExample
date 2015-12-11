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
    class func insertObject(context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.ReviewOrComment.rawValue as String, inManagedObjectContext: context)
        
        let newEntity = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        newEntity.setValue("Bart", forKey: "first")
        newEntity.setValue("Jacobs", forKey: "last")
        
        do {
            
            try newEntity.managedObjectContext?.save()
            
        } catch {
            
            print(error)
        }

        
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
