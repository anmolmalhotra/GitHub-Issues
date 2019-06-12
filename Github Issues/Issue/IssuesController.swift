//
//  IssuesController.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

class IssuesController: GITableViewController<IssueCell> {
    
    private let issueListViewModel: IssueListViewModel
    
    init(issueListViewModel: IssueListViewModel) {
        self.issueListViewModel = issueListViewModel
        
        super.init(title: Constants.Strings.issues)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        issueListViewModel.reload = { [weak self] in
            self?.tableView.reloadData()
        }
        
        issueListViewModel.tableViewStateObserver = { [weak self] (state) in
            self?.handleTableViewState(state)
        }
        
        issueListViewModel.fetch()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issueListViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IssueCell.self), for: indexPath) as! IssueCell
        cell.issueViewModel = issueListViewModel.issueViewModel(forRowAt: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let issueViewModel = issueListViewModel.issueViewModel(forRowAt: indexPath)
        let commentListViewModel = CommentListViewModel(issueViewModel: issueViewModel)
        
        let commentsController = CommentsController(commentListViewModel: commentListViewModel)
        self.navigationController?.pushViewController(commentsController, animated: true)
    }
    
    override func handleButton() {
        issueListViewModel.fetch()
    }
}
