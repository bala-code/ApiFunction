//
//  service.swift
//  alamo
//
//  Created by user165007 on 3/6/20.
//  Copyright © 2020 user165007. All rights reserved.
//

import Foundation
import Alamofire
class Service {
    fileprivate var baseUrl = ""
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getAllCountryNameFrom(endPoint:String)
    {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
            print("we got the response")
        }
        
    }
    
}
