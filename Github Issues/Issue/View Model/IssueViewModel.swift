//
//  IssueViewModel.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

struct IssueViewModel {
    private let issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }
    
    var title: String {
        return issue.title
    }
    
    var body: String {
        return String(issue.body?.prefix(140) ?? "")
    }
    
    var issueNumber: Int {
        return Int(issue.number)
    }
    
    var updatedAtDate: Date {
        return issue.updatedAt.convertToISOFormat()
    }
    
    var issueDetails: String {
        let createdAtDate = issue.createdAt.convertToISOFormat()
        
        let numberOfDaysAgoIssueOpened = createdAtDate.numberOfDays()
        let numberOfDaysAgoIssueUpdated = updatedAtDate.numberOfDays()
        
        return "#\(issueNumber) opened \(numberOfDaysAgoIssueOpened) ago and updated \(numberOfDaysAgoIssueUpdated)"
    }
    
    func fetchComments(_ completion: @escaping (GIResult<[Comment]>) -> ()) {
        Network.perform(request: Router.comments(issueNumber)) { (result: GIResult<[Comment]>) in
            completion(result)
        }
    }
}
