//
//  GIError.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

enum GIError: Error {
    case backendError(String, Int?)
    case incorrectFormat(String)
    
    var detail: String {
        switch self {
        case .backendError(let detail, _):
            return detail
            
        case .incorrectFormat(let incorrectFormat):
            return incorrectFormat
        }
    }
}
