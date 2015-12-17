//
//  CommentsModel+CoreDataProperties.swift
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

extension CommentsModel {

    @NSManaged var comment: String?
    @NSManaged var movie: NSObject?
    @NSManaged var objectId: String?
    @NSManaged var rating: NSNumber?

}
