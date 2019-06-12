//
//  Constants.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

struct Constants {
    
    struct EntityNames {
        static let issue = "Issue"
    }
    
    struct UserDefaultsKey {
        static let lastRequestSentTime = "lastRequestSentTime"
    }
    
    struct Strings {
        static let issues = "Issues"
        static let comments = "Comments"
        
        static let noIssueAvailable = "There is no issue available."
        static let noCommentInIssue = "There is no comment in this issue."
        
        static let somethingWentWrong = "Something went wrong. Please try again later."
    }
}
