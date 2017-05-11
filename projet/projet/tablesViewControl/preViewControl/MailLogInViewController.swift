//
//  MailLogInViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class MailLogInViewController: UIViewController {
    @IBOutlet weak var login_textField: UITextField!
    @IBOutlet weak var lastName_textField: UITextField!
    @IBOutlet weak var firstName_textField: UITextField!
    @IBOutlet weak var mail_textField: UITextField!
    @IBOutlet weak var pwd_textField: UITextField!
    @IBOutlet weak var confirmPwd_textField: UITextField!
    @IBOutlet weak var validButton: UIButton!
    
    let incorrectColor = UIColor(colorLiteralRed: (220.0/255.0), green: (99.0/255.0), blue: (99.0/255.0), alpha: 1.0)
    let normalColor = UIColor(colorLiteralRed: 95.0/255.0, green: 94.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    let disabeledButtonColor = UIColor(colorLiteralRed: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        validButton.layer.borderWidth = 1
        validButton.layer.cornerRadius = 5
        validButton.layer.borderColor = UIColor.darkGray.cgColor
        validButton.setTitleColor(disabeledButtonColor, for: UIControlState.disabled)
        validButton.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        
        self.login_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.lastName_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.firstName_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.mail_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.pwd_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.pwd_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        self.confirmPwd_textField.addTarget(self, action: #selector(validate(_:)), for: UIControlEvents.editingChanged)
        
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
                            field.textColor = self.normalColor
                            print("connection error")
                        }else if(resp==1){
                            field.textColor = self.incorrectColor
                            //print("element is exist")
                        }else if(resp==0){
                            field.textColor = self.normalColor
                        }
                    })
                }
                
            }else{
                field.textColor = self.incorrectColor
                //print("invalid caracters")
            }
            break
            
        case lastName_textField, firstName_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.name)){
                field.textColor = self.normalColor
            }else{
                field.textColor = self.incorrectColor
            }
            break
        
        case mail_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.mail)){
                field.textColor = self.normalColor
            }else{
                field.textColor = self.incorrectColor
            }
            break
        
        case pwd_textField:
            if(FieldValidation.shared.isValid(fieldText: field.text!, type: FieldValidation.FieldType.pwd)){
                if let ltext = field.text{
                    UserService.shared.isElementExists(element: "login", value: ltext, handler: {(resp: Int) in
                        if(resp==(-1)){
                            field.textColor = self.normalColor
                            print("connection error")
                        }else if(resp==1){
                            field.textColor = self.incorrectColor
                            //print("element is exist")
                        }else if(resp==0){
                            field.textColor = self.normalColor
                        }
                    })
                }
            }
            break
            
        case confirmPwd_textField:
            if(field.text == pwd_textField.text){
                field.textColor = self.normalColor
            }else{
                field.textColor = self.normalColor
            }
            
            break
            
        default:
            
            break
        }

    }

    func is_all_valid() -> Bool{
        
        
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
    
    func setTextRed(field: UITextField){
        if((field.text?.characters.count)! > 0){
            field.textColor = self.incorrectColor
        }
    }
    
    
    @IBAction func createUser_Button(_ sender: Any) {
    
    }
}
