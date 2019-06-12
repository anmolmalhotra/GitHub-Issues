//
//  UIView+Extension.swift
//  Github Issues
//
//  Created by Anmol Malhotra on 11/06/19.
//  Copyright © 2019 Anmol Malhotra. All rights reserved.
//

import UIKit

extension UIView {
    
    static func makeActivityIndicator(color: UIColor = UIColor.darkGray) -> UIActivityIndicatorView {
        let ai = UIActivityIndicatorView(style: .white)
        ai.hidesWhenStopped = true
        ai.color = color
        return ai
    }
    
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, centerX: NSLayoutXAxisAnchor?, paddings: UIEdgeInsets, size: CGSize) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddings.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddings.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddings.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddings.right).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func fillSuperview(padding: UIEdgeInsets = .zero) {
        guard let superview = superview else {
            fatalError("No superview found.")
        }
        
        anchor(top: superview.topAnchor, leading: superview.leadingAnchor, bottom: superview.bottomAnchor, trailing: superview.trailingAnchor, centerY: nil, centerX: nil, paddings: padding, size: .zero)
    }
    
    public var safeTopAnchor: NSLayoutYAxisAnchor { return optionalSafeAreaLayoutGuide?.topAnchor ?? topAnchor }
    public var safeBottomAnchor: NSLayoutYAxisAnchor { return optionalSafeAreaLayoutGuide?.bottomAnchor ?? bottomAnchor }
    
    public var safeLeftAnchor: NSLayoutXAxisAnchor { return optionalSafeAreaLayoutGuide?.leftAnchor ?? leftAnchor }
    public var safeRightAnchor: NSLayoutXAxisAnchor { return optionalSafeAreaLayoutGuide?.rightAnchor ?? rightAnchor }
    
    public var safeLeadingAnchor: NSLayoutXAxisAnchor { return optionalSafeAreaLayoutGuide?.leadingAnchor ?? leadingAnchor }
    public var safeTrailingAnchor: NSLayoutXAxisAnchor { return optionalSafeAreaLayoutGuide?.trailingAnchor ?? trailingAnchor }
    
    public var safeCenterXAnchor: NSLayoutXAxisAnchor { return optionalSafeAreaLayoutGuide?.centerXAnchor ?? centerXAnchor }
    public var safeCenterYAnchor: NSLayoutYAxisAnchor { return optionalSafeAreaLayoutGuide?.centerYAnchor ?? centerYAnchor }
    
    public var safeWidthAnchor: NSLayoutDimension { return optionalSafeAreaLayoutGuide?.widthAnchor ?? widthAnchor }
    public var safeHeightAnchor: NSLayoutDimension { return optionalSafeAreaLayoutGuide?.heightAnchor ?? heightAnchor }
    
    private var optionalSafeAreaLayoutGuide: UILayoutGuide? {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide
        } else {
            return nil
        }
    }
}
