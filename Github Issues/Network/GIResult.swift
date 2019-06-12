//
//  GIResult.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

enum GIResult<Value> {
    case success(Value)
    case failure(GIError)
    
    var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    var error: GIError? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
