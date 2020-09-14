//
//  BookingCardView.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 12/9/20.
//

import UIKit

class BookingCardView: UIView {
    
    let kCONTENT_XIB_NAME = "BookingCard"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var fromRouteNameLabel: UILabel!
    @IBOutlet var toRouteNameLabel: UILabel!
    @IBOutlet var ticketFareLabel: UILabel!
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5

    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
}
