//
//  UrlBuilder.swift
//  projet
//
//  Created by student5302 on 2/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation

class UrlBuilder: NSObject{
    public static let shared = UrlBuilder()
    
    let baseUrl = "http://shanowww.ddns.net/omk/"
    
    func user() -> String{
        return baseUrl+"user/"
    }
    
    func isElementExistGetQuery(element: String, value: String) -> String{
        print("\(user())?\(element)=\(value)")
        return user()+"?\(element)=\(value)"
    }
}
