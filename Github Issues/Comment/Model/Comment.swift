//
//  Comment.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

struct Comment: Decodable {
    let body: String
    let createdAt: String
    let user: User
    
    private enum CodingKeys: String, CodingKey {
        case body
        case createdAt = "created_at"
        case user
    }
}
