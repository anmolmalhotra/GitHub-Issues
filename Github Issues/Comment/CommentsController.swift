//
//  CommentsController.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

class CommentsController: GITableViewController<CommentCell> {
    
    private let commentListViewModel: CommentListViewModel
    
    init(commentListViewModel: CommentListViewModel) {
        self.commentListViewModel = commentListViewModel
        
        super.init(title: Constants.Strings.comments)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentListViewModel.reload = { [weak self] in
            self?.tableView.reloadData()
        }
        
        commentListViewModel.tableViewStateObserver = { [weak self] (state) in
            self?.handleTableViewState(state)
        }
        
        commentListViewModel.fetch()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentListViewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CommentCell.self), for: indexPath) as! CommentCell
        cell.commentViewModel = commentListViewModel.commentViewModel(forRowAt: indexPath)
        return cell
    }
    
    override func handleButton() {
        commentListViewModel.fetch()
    }
}
