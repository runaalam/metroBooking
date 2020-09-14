//
//  CitySelectView.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 12/9/20.
//

import UIKit

class CitySelectView: UIView {
    
    let kCONTENT_XIB_NAME = "CitySelect"
    
    // MARK: - IBOutlet
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var headLabel: UILabel!
    
    
    // MARK: - IBInspectable
  
    @IBInspectable var cornerRadius: CGFloat = 8
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5

    // MARK: - init
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    // MARK: - override methods
    
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
    
    func setColor(color: String) {
        switch color {
        case "Orange":
            contentView.backgroundColor = RouteType.Orange.customColor
            break
        case "Green":
            contentView.backgroundColor = RouteType.Green.customColor
            break
        case "Blue":
            contentView.backgroundColor = RouteType.Blue.customColor
            break
        case "Gray":
            contentView.backgroundColor = RouteType.Gray.customColor
            break
        default:
            contentView.backgroundColor = RouteType.Gray.customColor
        }
        
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
    }
}


