//
//  MoviesModel.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import Foundation
import CoreData

class MoviesModel: NSManagedObject {

    // Insert code here to add functionality to your managed object subclass
    class func insertObject(context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.CommentsModel.rawValue as String, inManagedObjectContext: context)
        
        let newEntity = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: context)
        
        newEntity.setValue("Bart", forKey: "first")
        newEntity.setValue("Jacobs", forKey: "last")
        
        do {
            
            try newEntity.managedObjectContext?.save()
            
        } catch {
            
            print(error)
        }
        
        
    }
    class func deleteObject(value:String,context:NSManagedObjectContext) {
        
        //Predicate
        let predicate = NSPredicate(format: "objectId = '\(value)'")
        
        // Initialize Fetch Request
        let fetchRequest = NSFetchRequest()
        
        // Create Entity Description
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, inManagedObjectContext: context)
        
        // Configure Fetch Request
        fetchRequest.entity = entityDescription
        fetchRequest.predicate = predicate
        
        do {
            
            let result = try context.executeFetchRequest(fetchRequest)
            
            for object in result{
                
                context.deleteObject(object as! NSManagedObject)
            }
            
        } catch {
            
            print(error as NSError)
        }
        
    }
    class func updateObject() {
        
        
    }
    class func truncateAllObject() {
        
        
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, context: context)
        
        return resultArray
    }

}
