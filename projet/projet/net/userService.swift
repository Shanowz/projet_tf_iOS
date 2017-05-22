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
    typealias ResponseResult = (Bool) -> ()
    
    func createUser(json: JSON, handler: @escaping ResponseResult){
        var request = URLRequest(url: URL(string: UrlBuilder.shared.user())!)
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
                let loginExists = json["login"].boolValue
                let mailExists = json["pwd"].boolValue
                
                if (!loginExists && !mailExists){
                    handler(true)
                }else{
                    handler(false)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                handler(false)
            }
        })
    }
    
    //return 0 if true, 1 if not, -1 if request error
    func isElementExists(element: String, value: String, handler: @escaping (Int) -> ()){
        let url = UrlBuilder.shared.isElementExistGetQuery(element: element, value: value)
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        print(UrlBuilder.shared.isElementExistGetQuery(element: element, value: value))
        
        Alamofire.request(request as URLRequestConvertible).responseJSON(completionHandler: {(resp: DataResponse<Any>) in
            switch resp.result {
            case .success(let value):
                let json = JSON(value)
                handler(json["exists"].intValue)
                
            case .failure(let error):
                print("error is ElementExists:")
                print(error)
                print(error.localizedDescription)
                handler(-1)
            }
        })
    }
}
