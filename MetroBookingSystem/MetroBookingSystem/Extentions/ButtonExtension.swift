//
//  ButtonExtension.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 12/9/20.
//


import UIKit

extension UIButton {
    func setInsets(
        forContentPadding contentPadding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        self.contentEdgeInsets = UIEdgeInsets(
            top: contentPadding.top,
            left: contentPadding.left,
            bottom: contentPadding.bottom,
            right: contentPadding.right + imageTitlePadding
        )
        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
    func setCustom(title: String, tinColor: UIColor) {
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.tintColor = tinColor
        
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor( red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0 ).cgColor
    }
}

