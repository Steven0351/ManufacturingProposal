//
//  FiberViewController.swift
//  GDT Manufacturing
//
//  Created by Steven Sherry on 12/23/16.
//  Copyright © 2016 Affinity for Apps. All rights reserved.
//

import UIKit

class FiberViewController: UIViewController {
    
    @IBOutlet weak var fiberTypeTextField: UITextField!
    @IBOutlet weak var fiberCountTextField: UITextField!
    @IBOutlet weak var jacketRatingTextField: UITextField!
    @IBOutlet weak var connectorSideaTextField: UITextField!
    @IBOutlet weak var connectorSidebTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var uomTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var fiberPickerView: UIPickerView!
    
    var uomArray = [""]
    var connectorArray = [""]
    var jacketRatingArray = [""]
    var fiberCountArray = [""]
    var fiberTypeArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uomArray = ["Feet","Meters"]
        connectorArray = ["LC/UPC", "SC/UPC","LC/APC","SC/APC","MTP Male","MTP Female","ST","FC","MT-RJ"]
        jacketRatingArray = ["Riser","Plenum","LSZH","I/O"]
        fiberCountArray = ["1","2","8","12","24","48","96","144"]
        fiberTypeArray = ["Simplex","Duplex - Round","Duplex - Zip","Breakout","Loose Tube","Microarray","Ribbon"]
        
    }

    func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView!, numberOfRowsInComponent component: Int) -> Int{
        return fiberCountArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fiberCountArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fiberCountTextField.text = fiberCountArray[row]
        fiberPickerView.isHidden = true;
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if fiberCountTextField.isSelected == true {
            fiberPickerView.isHidden = false
        }
        
        return false
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }


}
