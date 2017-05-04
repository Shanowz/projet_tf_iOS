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
    
    let incorrectColor = UIColor(colorLiteralRed: (220.0/255.0), green: (99.0/255.0), blue: (99.0/255.0), alpha: 1.0)
    let normalColor = UIColor(colorLiteralRed: 95.0/255.0, green: 94.0/255.0, blue: 95.0/255.0, alpha: 0.0)
    let disabeledButtonColor = UIColor(colorLiteralRed: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    
    typealias FieldValidationResult = (_ field: UITextField, _ valid: Bool) -> ()
    
    @IBOutlet weak var validButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        validButton.layer.borderWidth = 1
        validButton.layer.cornerRadius = 5
        validButton.layer.borderColor = UIColor.darkGray.cgColor
        validButton.setTitleColor(disabeledButtonColor, for: UIControlState.disabled)
        validButton.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
        
        disableSubmitButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
    func validateData() -> Bool{
//        if !isEmailValid(){
//            setTextRed(field: self.mail_textField)
//            return false
//        }else{
//            mail_textField.textColor = self.normalColor
//            return true
//        }
        
//        if !isLoginValid() {
//            if((self.mail_textField.text?.characters.count)! > 0){
//                mail_textField.textColor = self.incorrectColor
//            }
//            return false
//        }else{
//            
//        }
        
        if isFirstNameValid() {
            
        }
        
        if isLastNameValid() {
            
        }
        
        if isPasswordValid() {
            
        }
        
        return true
    }
    
    func isFirstNameValid() -> Bool {
        return false
    }
    
    func isLastNameValid() -> Bool {
        return false
    }
    
    func isPasswordValid() -> Bool {
        if let password = pwd_textField.text, let confirmPassword = confirmPwd_textField.text {
            if password == confirmPassword {
                if password.characters.count < 5 {
                    return true
                }
            }
        }
        return false
    }

    @IBAction func createUser_Button(_ sender: Any) {
    
    }
}
