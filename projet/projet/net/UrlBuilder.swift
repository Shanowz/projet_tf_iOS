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
    
    let baseUrl = "http://shanowww.ddns.net/"
    
    func signin() -> String{
        return baseUrl+"users/"
    }
}
