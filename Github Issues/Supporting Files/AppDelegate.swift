//
//  AppDelegate.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Passing PersistenceManager.shared using dependency injection ensures that we are always using same instance of persistence manager.
        let issueListViewModel = IssueListViewModel(persistenceManager: PersistenceManager.shared)
        
        let issuesController = IssuesController(issueListViewModel: issueListViewModel)
        let navigationController = UINavigationController(rootViewController: issuesController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
