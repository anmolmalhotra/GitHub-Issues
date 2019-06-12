//
//  IssueViewModel.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

class IssueListViewModel {
    
    private let persistenceManager: PersistenceManager
    
    init(persistenceManager: PersistenceManager) {
        self.persistenceManager = persistenceManager
    }
    
    private var issueViewModels = [IssueViewModel]()
    
    private var issues: [Issue]? {
        didSet {
            guard let issues = issues else { return }
            issueViewModels = issues.map { IssueViewModel(issue: $0) }
            
            // There are two ways to sort issues wrt to updated at.
            // We can use this sort method to sort our issues with recently updated issues on top or we can send sort=updated as query item in request. This will return issues in ordered format.
            // I am using the second method.
            //issueViewModels.sort { $0.updatedAtDate > $1.updatedAtDate }
            
            reload?()
        }
    }
    
    var reload: (() -> ())?
    
    var tableViewStateObserver: ((TableViewState) -> ())?
    
    var numberOfRows: Int {
        return issueViewModels.count
    }
    
    func issueViewModel(forRowAt indexPath: IndexPath) -> IssueViewModel {
        return issueViewModels[indexPath.row]
    }
    
    private let networkRequestTimer = NetworkRequestTimer()
    
    func fetch() {
        tableViewStateObserver?(.loading)
        
        if let issues = fetchFromStorage(), !networkRequestTimer.canSendRequest() {
            self.issues = issues
            tableViewStateObserver?(.loaded)
            return
        }
        
        Network.perform(request: Router.issues) { [weak self] (result: GIResult<[Issue]>) in
            
            switch result {
            case .success(let issues):
                
                self?.networkRequestTimer.requestSent()
                
                // According to assignment we have to clear old data before storing new data. So I am clearing data every time before saving.
                self?.clearFromStorage()
                
                // Saving issues to core data.
                self?.persistenceManager.save()
                
                if issues.isEmpty {
                    self?.tableViewStateObserver?(.empty(text: Constants.Strings.noIssueAvailable))
                } else {
                    self?.tableViewStateObserver?(.loaded)
                }
                
                self?.issues = issues
                
            case .failure(let error):
                print(error.detail)
                self?.tableViewStateObserver?(.error(errorText: error.detail))
            }
        }
    }
    
    private func fetchFromStorage() -> [Issue]? {
        return persistenceManager.fetch(Issue.fetchRequest())
    }
    
    private func clearFromStorage() {
        persistenceManager.clearFromStorage(forEntityName: Constants.EntityNames.issue)
    }
}
