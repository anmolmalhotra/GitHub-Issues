//
//  Int+Extension.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

extension Int {
    
    var pluralize: String {
        return self == 1 ? "" : "s"
    }
}
