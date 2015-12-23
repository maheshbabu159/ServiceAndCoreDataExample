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
    class func insertObject(dictionary:AnyObject, context:NSManagedObjectContext) {
        
        // Create Managed Object
        let entityDescription = NSEntityDescription.entityForName(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, inManagedObjectContext: context)
        
        //Create new entity
        let newEntity:MoviesModel = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: context) as! MoviesModel
        
        //Set propert values
        if let objectId = dictionary.valueForKey("objectId"){
            newEntity.objectId = objectId as? String
        }else{
            let uuid = NSUUID().UUIDString
            newEntity.objectId = uuid as String
        }
        if let cast = dictionary.valueForKey("cast"){
            newEntity.cast = cast as? String
        }
        if let name = dictionary.valueForKey("name"){
            newEntity.name = name as? String
        }
        if let descrption:String = dictionary.valueForKey("descrption") as? String{
            newEntity.descrption = descrption
        }
        if let industry:String = dictionary.valueForKey("industry") as? String{
            newEntity.industry = industry
        }
        if let movieLenght:Int = dictionary.valueForKey("movieLenght") as? Int{
            newEntity.movieLenght = NSNumber(integer:  movieLenght)
        }
        if let photo:NSDictionary = dictionary.valueForKey("photo") as? NSDictionary{
            newEntity.photo = photo
        }
        if let releaseDate:String = dictionary.valueForKey("releaseDate") as? String{
            newEntity.releaseDate = releaseDate
        }
        //Save the object
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
    class func truncateAllObjects(context:NSManagedObjectContext) {
        
        CommonOperations.truncateAllObjects(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, context: context)
    }
    class func fetchAllObjects(context:NSManagedObjectContext) -> NSArray {
        
        let resultArray = CommonOperations.fetchAllObjects(GlobalVariables.CoreDataEntities.MoviesModel.rawValue as String, context: context)
        
        return resultArray
    }

}
