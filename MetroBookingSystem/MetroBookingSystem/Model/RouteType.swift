//
//  RouteType.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 13/9/20.
//

import UIKit

enum RouteType {
    case Orange , Blue, Green, Gray
    
    var customColor: UIColor{
        switch self {
        case .Gray:
            return UIColor.lightGray
        case .Orange:
            return UIColor.orange
        case .Green:
            return UIColor.green
        case .Blue:
            return UIColor.systemBlue
        }
    }
}

