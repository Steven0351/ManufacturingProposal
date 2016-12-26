//
//  FiberViewController.swift
//  GDT Manufacturing
//
//  Created by Steven Sherry on 12/23/16.
//  Copyright © 2016 Affinity for Apps. All rights reserved.
//

import UIKit

class FiberViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var fiberTypeTextField: UITextField!
    @IBOutlet weak var fiberCountTextField: UITextField!
    @IBOutlet weak var jacketRatingTextField: UITextField!
    @IBOutlet weak var connectorSideaTextField: UITextField!
    @IBOutlet weak var connectorSidebTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var uomTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var fiberPickerView: UIPickerView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    var uomArray = [""]
    var connectorArray = [""]
    var jacketRatingArray = [""]
    var fiberCountArray = [""]
    var fiberTypeArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Define arrays for UIPickerView
        
        logoImageView.image = UIImage(named: "gdtmfg-logo")
        
        uomArray = ["Feet","Meters"]
        connectorArray = ["LC/UPC", "SC/UPC","LC/APC","SC/APC","MTP Male","MTP Female","ST","FC","MT-RJ"]
        jacketRatingArray = ["Riser","Plenum","LSZH","I/O"]
        fiberCountArray = ["1F","2F","8F","12F","24F","48F","96F","144F"]
        fiberTypeArray = ["Simplex","Duplex - Round","Duplex - Zip","Breakout","Loose Tube","Microarray","Ribbon"]
        
        fiberPickerView.delegate = self
        fiberPickerView.dataSource = self
        fiberPickerView.isHidden = true
        fiberTypeTextField.delegate = self
        fiberCountTextField.delegate = self
        jacketRatingTextField.delegate = self
        connectorSideaTextField.delegate = self
        connectorSidebTextField.delegate = self
        lengthTextField.delegate = self
        uomTextField.delegate = self
        quantityTextField.delegate = self
        fiberPickerView.removeFromSuperview()
        
        
        fiberTypeTextField.inputView = fiberPickerView
        fiberCountTextField.inputView = fiberPickerView
        jacketRatingTextField.inputView = fiberPickerView
        connectorSideaTextField.inputView = fiberPickerView
        connectorSidebTextField.inputView = fiberPickerView
        lengthTextField.inputView = fiberPickerView
        uomTextField.inputView = fiberPickerView
        quantityTextField.inputView = fiberPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return fiberCountArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fiberCountArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fiberCountTextField.text = fiberCountArray[row]
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if fiberCountTextField.isSelected == true {
            fiberPickerView.isHidden = false
        }
        
        return true
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }


}
