//
//  Issue+CoreDataClass.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Issue)
public class Issue: NSManagedObject, Codable {
    
    private enum CodingKeys: String, CodingKey {
        case title
        case body
        case number
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public required convenience init(from decoder: Decoder) throws {

        let entityName = Constants.EntityNames.issue

        guard let contextUserInfoKey = CodingUserInfoKey.context else { fatalError("cannot find context key") }

        guard let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext else { fatalError("cannot retrieve context") }
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext) else { fatalError() }
        
        self.init(entity: entity, insertInto: managedObjectContext)

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try container.decode(String.self, forKey: .title)
        self.body = try? container.decode(String.self, forKey: .body)
        self.number = try container.decode(Int32.self, forKey: .number)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(title, forKey: .title)
        try container.encode(body, forKey: .body)
        try container.encode(number, forKey: .number)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
    }
}

extension CodingUserInfoKey {
    static let context = CodingUserInfoKey(rawValue: "context")
}
