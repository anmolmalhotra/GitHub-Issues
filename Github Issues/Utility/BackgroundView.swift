//
//  EmptyView.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 12/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

protocol BackgroundViewDelegate: class {
    func handleButton()
}

class BackgroundView: UIView {
    
    weak var delegate: BackgroundViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Try Again", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .subheadline)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var showButton: Bool = false {
        didSet {
            button.isHidden = !showButton
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutViews()
        
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
    
    @objc private func handleButton() {
        delegate?.handleButton()
    }
    
    private func layoutViews() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, button])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, centerY: centerYAnchor, centerX: nil, paddings: .init(top: 0, left: 16, bottom: 0, right: 16), size: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
