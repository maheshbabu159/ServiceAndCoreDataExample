//
//  ReviewOrComment.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//

import Foundation
import CoreData

class ReviewOrComment: NSManagedObject {
    
    // Insert code here to add functionality to your managed object subclass
    class func insertObject(dictionary:AnyObject, context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.ReviewOrComment.rawValue as String, inManagedObjectContext: context)
        
        //Create new entity
        let newEntity:ReviewOrComment = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: context) as! ReviewOrComment
        
        //Set propert values
        if let objectId = dictionary.valueForKey("objectId"){
            
             newEntity.objectId = objectId as? String
        }
        if let comment = dictionary.valueForKey("comment"){
            
            newEntity.comment = comment as? String
        }
        if let movie:NSDictionary = dictionary.objectForKey("movie") as? NSDictionary{
            
            newEntity.movie = movie as NSDictionary
        }
        if let rating:NSNumber = dictionary.valueForKey("rating") as? NSNumber{
            
            newEntity.rating = rating
        }
       
        //Save the object
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
    class func truncateAllObjects(context:NSManagedObjectContext) {
        
        CommonOperations.truncateAllObjects(GlobalVariables.CoreDataEntities.ReviewOrComment.rawValue as String, context: context)
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.ReviewOrComment.rawValue as String, context: context)
        
        return resultArray
    }
    
}
