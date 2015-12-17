//
//  MoviesModel+CoreDataProperties.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/17/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MoviesModel {

    @NSManaged var cast: String?
    @NSManaged var descrption: String?
    @NSManaged var industry: String?
    @NSManaged var movieLenght: NSNumber?
    @NSManaged var name: String?
    @NSManaged var objectId: String?
    @NSManaged var photo: NSObject?
    @NSManaged var releaseDate: String?

}
