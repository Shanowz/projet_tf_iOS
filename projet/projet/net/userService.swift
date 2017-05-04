//
//  userService.swift
//  projet
//
//  Created by student5302 on 2/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserService: NSObject{
    public static let shared = UserService()
    typealias ResponseResult = (JSON) -> ()
    
    func createUser(json: JSON, handler: @escaping ResponseResult){
        var request = URLRequest(url: URL(string: UrlBuilder.shared.signin())!)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        do{
            try request.httpBody = json.rawData()
        } catch {
            print("can't create RawData")
        }
        
        Alamofire.request(request as URLRequestConvertible).responseJSON(completionHandler: {(resp: DataResponse<Any>) in
            switch resp.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
                
            case .failure(let error):
                print(error.localizedDescription)
                handler(json)
            }
        })
    }
}
