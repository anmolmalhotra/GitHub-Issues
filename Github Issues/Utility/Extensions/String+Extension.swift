//
//  String+Extension.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

extension String {
    
    func convertToISOFormat() -> Date {
        let dateFormatter = ISO8601DateFormatter()
        
        guard let date = dateFormatter.date(from: self) else {
            fatalError("Invalid date format")
        }
        
        return date
    }
}
