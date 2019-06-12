//
//  IssueCell.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

class IssueCell: UITableViewCell {
    
    var issueViewModel: IssueViewModel? {
        didSet {
            guard let issueViewModel = issueViewModel else { return }
            
            titleLabel.text = issueViewModel.title
            issueDetailsLabel.text = issueViewModel.issueDetails
            
            let body = issueViewModel.body
            
            bodyLabel.text = body
            bodyLabel.isHidden = body.isEmpty
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let issueDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        layoutViews()
    }
    
    private func layoutViews() {
        let layoutGuide = contentView.layoutMarginsGuide
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, issueDetailsLabel, bodyLabel])
        stackView.spacing = 4
        stackView.axis = .vertical
        
        contentView.addSubview(stackView)
        stackView.anchor(top: layoutGuide.topAnchor, leading: layoutGuide.leadingAnchor, bottom: layoutGuide.bottomAnchor, trailing: layoutGuide.trailingAnchor, centerY: nil, centerX: nil, paddings: .init(top: 4, left: 0, bottom: 4, right: 0), size: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
