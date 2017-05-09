//
//  FirstViewController.swift
//  projet
//
//  Created by student5301 on 24/04/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit
import SwiftyJSON

class FirstViewController: UIViewController {

    @IBOutlet weak var connectButton: UIButton!
    @IBOutlet weak var inscrisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customButton(button: connectButton)
        customButton(button: inscrisButton)
        
    }
    
    func customButton(button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.white.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
