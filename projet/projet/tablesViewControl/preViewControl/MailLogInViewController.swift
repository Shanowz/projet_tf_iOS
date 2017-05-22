//
//  MailLogInViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit
import SwiftyJSON

class MailLogInViewController: UIViewController {
    @IBOutlet weak var login_textField: UITextField!
    @IBOutlet weak var lastName_textField: UITextField!
    @IBOutlet weak var firstName_textField: UITextField!
    @IBOutlet weak var mail_textField: UITextField!
    @IBOutlet weak var pwd_textField: UITextField!
    @IBOutlet weak var confirmPwd_textField: UITextField!
    @IBOutlet weak var validButton: UIButton!
    
    var user:User?
    
    let incorrectColor = UIColor(colorLiteralRed: (220.0/255.0), green: (99.0/255.0), blue: (99.0/255.0), alpha: 1.0)
    let normalColor = UIColor(colorLiteralRed: 95.0/255.0, green: 94.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    let disabeledButtonColor = UIColor(colorLiteralRed: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    
    var fields4validation = [UITextField: Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fields4validation = [login_textField: false, lastName_textField: false, firstName_textField: false, mail_textField: false, pwd_textField: false, confirmPwd_textField: false]
        
//        validButton.layer.borderWidth = 1
//        validButton.layer.cornerRadius = 5
//        validButton.layer.borderColor = UIColor.darkGray.cgColor
//        validButton.setTitleColor(disabeledButtonColor, for: UIControlState.disabled)
//        validButton.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        
        for (field, _) in self.fields4validation{
            field.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        }
        
        disableSubmitButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func validate(_ field: UITextField){
        switch field {
        case login_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.name)){
                if let ltext = field.text{
                    UserService.shared.isElementExists(element: "login", value: ltext, handler: {(resp: Int) in
                        if(resp==(-1)){
                            //connection error
                        }else if(resp==1){
                            self.devalidDaField(field: field)
                        }else if(resp==0){
                            self.validDaField(field: field)
                        }
                    })
                }
                
            }else{
                self.devalidDaField(field: field)
            }
            break
            
        case lastName_textField, firstName_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.name)){
                self.validDaField(field: field)
            }else{
                self.devalidDaField(field: field)
            }
            break
        
        case mail_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.mail)){
                if let ltext = field.text{
                    UserService.shared.isElementExists(element: "mail", value: ltext, handler: {(resp: Int) in
                        if(resp==(-1)){
                            //connection error
                        }else if(resp==1){
                            self.devalidDaField(field: field)
                        }else if(resp==0){
                            self.validDaField(field: field)
                        }
                    })
                }
            }else{
                self.devalidDaField(field: field)
            }
            break
        
        case pwd_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.pwd)){
                self.validDaField(field: field)
            }else{
                self.devalidDaField(field: field)
            }
            break
            
        case confirmPwd_textField:
            if(field.text == pwd_textField.text){
                self.validDaField(field: field)
            }else{
                self.devalidDaField(field: field)
            }
            break
            
        default:
            break
        }
        
        if(is_all_valid()){
            enableSubmitButton()
        }else{
            disableSubmitButton()
        }
    }
    
    func validDaField(field: UITextField){
        field.textColor = self.normalColor
        fields4validation[field] = true
    }
    
    func devalidDaField(field: UITextField){
        field.textColor = self.incorrectColor
        fields4validation[field] = false
    }

    func is_all_valid() -> Bool{
        for (field, isValid) in self.fields4validation{
            if(!isValid){
                return false
            }
        }
        return true
    }
    
    func enableSubmitButton(){
        validButton.layer.borderColor = UIColor.darkGray.cgColor
        validButton.isEnabled = true
    }
    
    func disableSubmitButton(){
        validButton.layer.borderColor = UIColor.lightGray.cgColor
        validButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "user_profil" {
            if let viewController = segue.destination as? UserProfileViewController{
                viewController.user = User(login: login_textField.text!, pwd: pwd_textField.text!, mail: mail_textField.text!, fname: firstName_textField.text!, lname: lastName_textField.text!)
            }
        }
    }
    
    @IBAction func createUser(_ sender: Any) {
        let user = User(login: login_textField.text!, pwd: pwd_textField.text!, mail: mail_textField.text!, fname: firstName_textField.text!, lname: lastName_textField.text!)
        UserService.shared.createUser(json: user.toJSON(), handler: {(resp: Bool) in
            if resp{
                print("user has been created")
            }else{
                print("can't create the user")
            }
        })
    }
}



