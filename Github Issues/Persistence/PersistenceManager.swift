//
//  PersistenceManager.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation
import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    private init() { }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Github_Issues")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    // Saves current managed object context to core data.
    func save() {
        do {
            try context.save()
            print("saved successfully")
        } catch {
            print("saving error:", error)
        }
    }
    
    // It takes a generic parameter of type codable and corresponding fetch request to fetch model from core data.
    func fetch<T: Codable>(_ request: NSFetchRequest<T>) -> [T]? {
        do {
            print("fetched successfully")
            return try context.fetch(request)
        } catch let error {
            print("fetching error:", error)
            return nil
        }
    }
    
    // Clears the data in core data for entity.
    func clearFromStorage(forEntityName entityName: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(batchDeleteRequest)
            print("cleared successfully")
        } catch let error as NSError {
            print("clearing error:", error)
        }
    }
}
