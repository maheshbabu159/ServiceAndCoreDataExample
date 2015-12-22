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

    class func updateObject() {
        
        
    }
    class func truncateAllObject() {
        
        
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, context: context)
        
        return resultArray
    }

}
