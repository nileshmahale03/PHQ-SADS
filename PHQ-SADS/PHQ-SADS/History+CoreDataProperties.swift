//
//  History+CoreDataProperties.swift
//  PHQ-SADS
//
//  Created by Nilesh Mahale on 1/24/16.
//  Copyright © 2016 Code-Programming. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension History {

    @NSManaged var date: String
    @NSManaged var score: String
    @NSManaged var test: String

}
