//
//  RouteDetails.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 11/9/20.
//

import Foundation
 
struct RouteDetails: Codable {

    let id: Int?
    let routeName: String?
    let isInterchange : Bool?
    let routeType: [String]?
    let connectRoute: [String]?
}
