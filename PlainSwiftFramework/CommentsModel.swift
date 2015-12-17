//
//  CommentsModel.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import Foundation
import CoreData

class CommentsModel: NSManagedObject {

    // Insert code here to add functionality to your managed object subclass
    class func insertObject(dictionary:AnyObject, context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.CommentsModel.rawValue as String, inManagedObjectContext: context)
        
        //Create new entity
        let newEntity:ReviewOrComment = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: context) as! ReviewOrComment
        
        //Set propert values
        if let objectId = dictionary.valueForKey("objectId"){
            
            newEntity.objectId = objectId as? String
            
        }else{
            
            let uuid = NSUUID().UUIDString
            newEntity.objectId = uuid as String
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
        
        CommonOperations.truncateAllObjects(GlobalVariables.CoreDataEntities.CommentsModel.rawValue as String, context: context)
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.CommentsModel.rawValue as String, context: context)
        
        return resultArray
    }


}
