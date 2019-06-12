//
//  CommentCell.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    var commentViewModel: CommentViewModel? {
        didSet {
            guard let commentViewModel = commentViewModel else { return }
            
            commentDetailsLabel.text = commentViewModel.commentDetails
            bodyLabel.text = commentViewModel.body
        }
    }
    
    private let commentDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.textColor = .lightGray
        return label
    }()
    
    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        layoutViews()
    }
    
    private func layoutViews() {
        let layoutGuide = contentView.layoutMarginsGuide
        
        let stackView = UIStackView(arrangedSubviews: [commentDetailsLabel, bodyLabel])
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
