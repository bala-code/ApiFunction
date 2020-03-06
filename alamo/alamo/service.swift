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
    typealias countriesCallBack = (_ countries:[Country]?, _ Status: Bool, message:String) -> Void
    var callBack:countriesCallBack?
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getAllCountryNameFrom(endPoint:String)
    {
        AF.request(self.baseUrl + endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { (responseData) in
          //  print("we got the response")
            guard let data = responseData.data else {
                 self.callBack?(nil, false, "")
                return}
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                self.callBack?(countries, true, "")
                   // print("countries == \(countries)")
            } catch {
                //print("error decoding == \(error)" )
                self.callBack?(nil, false, error.localizedDescription)
            }
            
        }
      
        func completionHandler(callBack: @escaping countriesCallBack) {
            self.callBack = callBack
        }
        
    }
    
}
