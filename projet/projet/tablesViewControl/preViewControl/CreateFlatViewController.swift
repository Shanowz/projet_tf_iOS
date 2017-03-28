//
//  CreateFlatViewController.swift
//  projet
//
//  Created by student5302 on 28/02/17.
//  Copyright © 2017 student5302. All rights reserved.
//

import UIKit

class CreateFlatViewController: UIViewController {

    @IBOutlet weak var numberPickerView: UIPickerView!
    
    var pickerNumber: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberPickerView.delegate = self
        numberPickerView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNumberPicker () {
        
        //var number: Int = 1
        for number in 1...100 {
            pickerNumber.append(number)
            //number += 1
        }
        
    }
    
}

extension CreateFlatViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerNumber.count
    }
    
    func pickerView(_: UIPickerView, titleForRow: Int, forComponent component: Int) -> String? {
        
        setNumberPicker()
        
        let s = NSString(format: "%.0f", pickerNumber[titleForRow])
        print("data : \(s)")
        return s as String
    }
    
}
