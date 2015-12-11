//
//  Movies+CoreDataProperties.swift
//  
//
//  Created by maheshbabu.somineni on 12/10/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var name: String?
    @NSManaged var industry: String?
    @NSManaged var cast: String?
    @NSManaged var descrption: String?
    @NSManaged var releaseDate: String?
    @NSManaged var photo: NSObject?
    @NSManaged var movieLenght: NSNumber?
    @NSManaged var objectId: String?

}
