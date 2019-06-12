//
//  CommentListViewModel.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import Foundation

class CommentListViewModel {
    
    private let issueViewModel: IssueViewModel
    
    init(issueViewModel: IssueViewModel) {
        self.issueViewModel = issueViewModel
    }
    
    private var commentViewModels = [CommentViewModel]()
    
    private var comments: [Comment]? {
        didSet {
            guard let comments = comments else { return }
            commentViewModels = comments.map { CommentViewModel(comment: $0) }
            
            reload?()
        }
    }
    
    var reload: (() -> ())?
    
    var tableViewStateObserver: ((TableViewState) -> ())?
    
    var numberOfRows: Int {
        return commentViewModels.count
    }
    
    func commentViewModel(forRowAt indexPath: IndexPath) -> CommentViewModel {
        return commentViewModels[indexPath.row]
    }
    
    func fetch() {
        tableViewStateObserver?(.loading)
        
        issueViewModel.fetchComments { [weak self] (result: GIResult<[Comment]>) in
            
            switch result {
            case .success(let comments):
                
                if comments.isEmpty {
                    self?.tableViewStateObserver?(.empty(text: Constants.Strings.noCommentInIssue))
                } else {
                    self?.tableViewStateObserver?(.loaded)
                }
                
                self?.comments = comments
                
            case .failure(let error):
                print(error.detail)
                self?.tableViewStateObserver?(.error(errorText: error.detail))
            }
        }
    }
}
