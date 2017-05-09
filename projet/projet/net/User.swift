//
//  User.swift
//  projet
//
//  Created by student5302 on 2/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
import SwiftyJSON

class User{
    let login:String!
    let pwd:String!
    let mail:String!
    
    init(login:String, pwd:String, mail:String) {
        self.login = login
        self.pwd = pwd
        self.mail = mail
    }
    
    func toJSON() -> JSON{
        let json: NSMutableDictionary = NSMutableDictionary()
        
        json.setValue(self.login, forKey: "login")
        json.setValue(self.pwd, forKey: "pwd")
        json.setValue(self.mail, forKey: "mail")
        
        //let jsonData = try! JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String: Any]]
        return JSON(json)
        
    }
}
