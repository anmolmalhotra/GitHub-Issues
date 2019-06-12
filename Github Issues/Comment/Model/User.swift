//
//  User.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

struct User: Decodable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
