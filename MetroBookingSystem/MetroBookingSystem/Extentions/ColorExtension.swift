//
//  ColorExtension.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 12/9/20.
//


import UIKit

extension UIColor {
    convenience init(hex hexString:String) {
        var hexString = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (hexString.hasPrefix("#")) {
            hexString.remove(at: hexString.startIndex)
        }
       
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let mask = 0x000000FF
        let r = Int(rgbValue >> 16) & mask
        let g = Int(rgbValue >> 8) & mask
        let b = Int(rgbValue) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}
