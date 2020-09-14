//
//  TicketFare.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 14/9/20.
//

import Foundation

class TicketFare {
    
    //Calculate fare
    static func calculate(fromRoute: RouteDetails, toRoute: RouteDetails) -> Double{
        
        var fare : Double = 2
       
        
        if oneRouteIsInterchange(fromRoute: fromRoute, toRoute: toRoute){
            fare = 2
            print("Fare is 2$")
        } else if routeHasConnection(fromRouteConnections: fromRoute.connectRoute!, toRouteConnections: toRoute.connectRoute!){
            if routeHasSameType(fromRouteType: fromRoute.routeType!, toRouteType: toRoute.routeType!) {
                fare = 2
            } else {
                fare = 5
            }
        } else  {
             fare = 10
        }
        return fare
    }
    
    //check one station is interchange and has connecting route
      static func oneRouteIsInterchange(fromRoute: RouteDetails, toRoute: RouteDetails)->Bool {
          if fromRoute.isInterchange! && ((toRoute.connectRoute?.contains(fromRoute.routeName!)) != nil){
              return true
          } else if toRoute.isInterchange! && ((fromRoute.connectRoute?.contains(toRoute.routeName!)) != nil){
              return true
          }
          return false
      }

    //both station has exactly same connection
    static func routeHasConnection(fromRouteConnections: [String], toRouteConnections: [String]) -> Bool {
        print(fromRouteConnections)
        print(toRouteConnections)
        for item in fromRouteConnections {
            if (toRouteConnections.contains(item)) {
                return true
            }
        }
     
        return false
    }
    
    //both station not on same route but has connection via interchange
    static func routeHasSameType(fromRouteType: [String], toRouteType: [String]) -> Bool {
        for item in fromRouteType{
            if (toRouteType.contains(item)) {
                return true
            }
        }
        return false
    }
}
