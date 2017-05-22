//
//  FieldValidation.swift
//  projet
//
//  Created by student5302 on 8/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
class FieldValidation: NSObject{
    enum FieldType{
        case name
        case pwd
        case mail
        case text
    }
    
    public static let shared: FieldValidation = FieldValidation()
    
    func isValid(fieldText: String, type: FieldType) -> Bool{
        switch type{
        case .name:
            if(fieldText.characters.count < 3 || fieldText.characters.count > 26){
                return false;
            }
            
            let regex = "^[a-zA-Z]([0-9a-zA-Z]|[-'_.]|[éêèëàäöôïîùûü]){2,24}$"
            if let range = fieldText.range(of:regex, options: .regularExpression) {
                return true
            }
            
            return false
            
        case .pwd:
            if(fieldText.characters.count < 6){
                return false
            }
            
            let regexUPCASE = "[A-Z]"
            let regexLOWERCASE = "[a-z]"
            let regexNumbers = "[0-9]"
            if nil == fieldText.range(of:regexUPCASE, options: .regularExpression) {
                return false
            }
            
            if nil == fieldText.range(of:regexLOWERCASE, options: .regularExpression){
                return false
            }
            
            if nil == fieldText.range(of:regexNumbers, options: .regularExpression){
                return false
            }
            
            return true

        case .mail:
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            if let range = fieldText.range(of:regex, options: .regularExpression) {
                return true
            }
            
            return false
            
        case .text:
            
            return true
        }
    }
}
