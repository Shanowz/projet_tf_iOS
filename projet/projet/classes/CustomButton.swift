//
//  CustomButton.swift
//  projet
//
//  Created by student5302 on 11/05/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    let disabeledButtonColor = UIColor(colorLiteralRed: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        super.layer.borderWidth = 1
        super.layer.cornerRadius = 5
        super.layer.borderColor = UIColor.darkGray.cgColor
        super.setTitleColor(disabeledButtonColor, for: UIControlState.disabled)
        super.setTitleColor(UIColor.darkGray, for: UIControlState.normal)
    }
}
