//
//  CreateFlatViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class CreateFlatViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var numberPickerView: UIPickerView!
    
    var pickerNumber: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberPickerView.delegate = self
        self.numberPickerView.dataSource = self
        
        var number: Int = 1
        for _ in 1...100 {
            pickerNumber.append(number)
            number += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerNumber.count
    }
    
    func pickerView(_: UIPickerView, titleForRow: Int, forComponent component: Int) -> String? {
        let s = NSString(format: "%.0f", pickerNumber[titleForRow])
        return s as String
    }
    
}
