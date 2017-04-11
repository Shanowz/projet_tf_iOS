//
//  MailLogInViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class MailLogInViewController: UIViewController {

    @IBOutlet weak var firstNameTextFieldOutlet: UITextField!
    
    @IBOutlet weak var lastNameTextFieldOutlet: UITextField!
    
    @IBOutlet weak var mailTextFieldOutlet: UITextField!
    
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    @IBOutlet weak var confirmPasswordTextFieldOutlet: UITextField!
    
    var firstName:          String = ""
    var lastName:           String = ""
    var mail:               String = ""
    var password:           String = ""
    var confirmPassword:    String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateData() -> Bool{
        if !isEmailValid(){
            return false
        }
        
        //autres test...
        
        
        return true
    }
    
    @IBAction func validButtonAction(_ sender: Any) {
        if validateData(){
            //envoyer réseau
        }else{
            //pop up ou un truc du genre
        }
        
    }
    
    func isEmailValid() -> Bool{
        return false
    }

}

extension MailLogInViewController: UITextFieldDelegate {
    
    
    
}
