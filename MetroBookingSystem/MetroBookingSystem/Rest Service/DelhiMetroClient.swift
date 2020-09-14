//
//  DelhiMetroClient.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 11/9/20.
//

import Foundation


class DelhiMetroClient {
    enum Endpoints {
     
        static let baseUrl = "http://localhost:8000/delhiMetro"
        
        case rootList
        
        var stringValue: String {
            switch self {
                
            case .rootList:
                return Endpoints.baseUrl + "/routeList"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }

    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    
            guard let data = data else {
                print("##### DATA Nil #####")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let routeList = try decoder.decode(responseType.self, from: data)
                completion(routeList, nil)
            } catch {
                print(error)
            }
        }
        task.resume()
        return task
    }
    
    class func getRootList(completionHandler : @escaping (_ routeList: [RouteDetails]?,_ error: Error?) -> Void) {
        let url = Endpoints.rootList.url
        _ = taskForGETRequest(url: url, responseType: [RouteDetails].self) {routeList, error in
           
            if let list : [RouteDetails] = routeList {
                completionHandler(list, nil)
            } else {
                completionHandler([], error)
            }
        }
    }
}
