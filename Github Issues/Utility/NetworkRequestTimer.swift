//
//  RequestTimer.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

class NetworkRequestTimer {
    
    private let key = Constants.UserDefaultsKey.lastRequestSentTime
    
    func requestSent() {
        UserDefaults.standard.set(Date(), forKey: key)
    }
    
    func canSendRequest() -> Bool {
        if let lastRequestSentTime = UserDefaults.standard.value(forKey: key) as? Date {
            let calendar = Calendar.current
            
            if let day = calendar.dateComponents([.day], from: lastRequestSentTime, to: Date()).day {
                return day > 0
            }
        }
        
        // This means we haven't saved last request sent time. So we want to send a request.
        return true
    }
}
