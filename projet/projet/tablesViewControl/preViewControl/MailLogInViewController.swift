//
//  MailLogInViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class MailLogInViewController: UIViewController {

    @IBOutlet weak var validButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        validButton.layer.borderWidth = 1
        validButton.layer.cornerRadius = 5
        validButton.layer.borderColor = UIColor.darkGray.cgColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func validateData() -> Bool{
//        if !isEmailValid(){
//            return false
//        }
//        
//        if isLoginValid() {
//            
//        }
//        
//        if isFirstNameValid() {
//            
//        }
//        
//        if isLastNameValid() {
//            
//        }
//        
//        if isPasswordValid() {
//            
//        }
        
        //autres test...
        
        
   //     return true
    //}
    
    //@IBAction func validButtonAction(_ sender: Any) {
      //  if validateData(){
            //envoyer réseau
       // }else{
            //pop up ou un truc du genre
        //}
        
//    }
//    
//    func isEmailValid() -> Bool {
//        return false
//    }
//    
//    func isLoginValid() -> Bool {
//        return false
//    }
//    
//    func isFirstNameValid() -> Bool {
//        return false
//    }
//    
//    func isLastNameValid() -> Bool {
//        return false
//    }
    
//    func isPasswordValid() -> Bool {
//        if let password = passwordTextFieldOutlet.text, let confirmPassword = confirmPasswordTextFieldOutlet.text {
//            if password == confirmPassword {
//                if password.characters.count < 5 {
//                    return true
//                }
//            }
//        }
//        return false
//    }


    
}

extension MailLogInViewController: UITextFieldDelegate {
    
    
    
}
