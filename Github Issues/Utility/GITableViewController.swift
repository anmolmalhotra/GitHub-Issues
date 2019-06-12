//
//  GITableViewController.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

class GITableViewController<Cell: UITableViewCell>: UITableViewController, BackgroundViewDelegate {
    
    init(title: String) {
        super.init(style: .plain)
        
        self.title = title
    }
    
    private let activityIndicator = UIView.makeActivityIndicator()
    private let backgroundView = BackgroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        backgroundView.delegate = self
    }
    
    func handleTableViewState(_ state: TableViewState) {
        switch state {
        case .loading:
            activityIndicator.startAnimating()
            tableView.backgroundView = activityIndicator
            
        case .loaded:
            activityIndicator.stopAnimating()
            tableView.backgroundView = nil
            
        case .empty(text: let text):
            backgroundView.title = text
            backgroundView.showButton = false
            tableView.backgroundView = backgroundView
            
        case .error(errorText: let errorText):
            backgroundView.title = errorText
            backgroundView.showButton = true
            tableView.backgroundView = backgroundView
        }
    }
    
    private func setup() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableView.automaticDimension
        
        clearsSelectionOnViewWillAppear = true
        tableView.register(Cell.self, forCellReuseIdentifier: String(describing: Cell.self))
        
        handleTableViewState(.loading)
    }
    
    func handleButton() {
        fatalError("Override this method.")
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
