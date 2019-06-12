//
//  TableViewState.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

enum TableViewState {
    case loading
    case loaded
    case empty(text: String)
    case error(errorText: String)
}
