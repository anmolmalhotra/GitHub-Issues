//
//  Issue+CoreDataProperties.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//
//

import Foundation
import CoreData

extension Issue {
    
    @NSManaged public var title: String
    @NSManaged public var body: String?
    @NSManaged public var number: Int32
    @NSManaged public var createdAt: String
    @NSManaged public var updatedAt: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Issue> {
        let entityName = Constants.EntityNames.issue
        
        let fetchRequest = NSFetchRequest<Issue>(entityName: entityName)
        
        let sortDescriptor = NSSortDescriptor(key: "updatedAt", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        return fetchRequest
    }
}
