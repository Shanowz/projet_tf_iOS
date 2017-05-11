//
//  User.swift
//  projet
//
//  Created by student5302 on 2/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
import SwiftyJSON
import SwiftHash

class User{
    let pwd:String!
    let mail:String!
    var fname:String?
    var lname:String?
    let login:String!
    var shcool:String?
    var studies:String?
    var description:String?
    var center_interest:String?
    
    init(login:String, pwd:String, mail:String, fname:String, lname:String) {
        self.pwd    = MD5(pwd)
        self.mail   = mail
        self.login  = login
        self.lname  = lname
        self.fname  = fname
    }
    
    func toJSON() -> JSON{
        let json: NSMutableDictionary = NSMutableDictionary()
        json.setValue(self.login, forKey: "login")
        json.setValue(self.pwd, forKey: "pwd")
        json.setValue(self.mail, forKey: "mail")
        
        if let lfname = fname{
            json.setValue(lfname, forKey: "fname")
        }
        if let llname = lname{
            json.setValue(llname, forKey: "lname")
        }
        if let lshcool = shcool{
            json.setValue(lshcool, forKey: "shcool")
        }
        if let lstudies = studies{
            json.setValue(lstudies, forKey: "studies")
        }
        if let ldesc = description{
            json.setValue(ldesc, forKey: "description")
        }
        if let lcenter = center_interest{
            json.setValue(lcenter, forKey: "interests")
        }
        
        //let jsonData = try! JSONSerialization.jsonObject(with: json, options: .allowFragments) as? [[String: Any]]
        return JSON(json)
    }
}
