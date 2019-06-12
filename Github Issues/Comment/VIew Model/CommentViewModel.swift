//
//  CommentViewModel.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

struct CommentViewModel {
    
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: String {
        let body = comment.body
        
        // This is not neccessary.
        // Each comment is having a next line at the end. So I am just removing it so that layout looks better.
        if body.hasSuffix("\n") {
            return String(body.dropLast(2))
        } else {
            return body
        }
    }
    
    var user: User {
        return comment.user
    }
    
    var commentDetails: String {
        let createdAtDate = comment.createdAt.convertToISOFormat()
        
        let numberOfDaysAgoCommented = createdAtDate.numberOfDays()
        return "Commented \(numberOfDaysAgoCommented) ago by \(user.name)"
    }
}
