//
//  Date+Extension.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

extension Date {
    
    func numberOfDays() -> String {
        let calendar = Calendar.current
        
        guard let numberOfDays = calendar.dateComponents([.day], from: self, to: Date()).day else {
            return ""
        }
        
        return "\(numberOfDays) Day\(numberOfDays.pluralize)"
    }
}
