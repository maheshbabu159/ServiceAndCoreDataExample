//
//  ReviewOrComment+CoreDataProperties.swift
//  SwiftCoreDataSimpleDemo
//
//  Created by maheshbabu.somineni on 12/10/15.
//  Copyright © 2015 CHENHAO. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ReviewOrComment {

    @NSManaged var objectId: String?
    @NSManaged var comment: String?
    @NSManaged var movie: AnyObject?
    @NSManaged var rating: NSNumber?

}
