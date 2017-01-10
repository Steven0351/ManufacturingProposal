//
//  FiberViewController.swift
//  GDT Manufacturing
//
//  Created by Steven Sherry on 12/23/16.
//  Copyright © 2016 Affinity for Apps. All rights reserved.
//

import UIKit

class FiberViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var fiberTypeTextField: UITextField!
    @IBOutlet weak var fiberCountTextField: UITextField!
    @IBOutlet weak var jacketRatingTextField: UITextField!
    @IBOutlet weak var connectorSideaTextField: UITextField!
    @IBOutlet weak var connectorSidebTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var uomTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var fiberTypePicker: UIPickerView!
    
    var uomArray = [""]
    var connectorArray = [""]
    var jacketRatingArray = [""]
    var fiberCountArray = [""]
    var fiberTypeArray = [""]
    var errorArray = [""]
    var currentArray = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        logoImageView.image = UIImage(named: "gdtmfg-logo")
        
        //Arrays for pickerViews
        
        uomArray = ["","Feet","Meters"]
        connectorArray = ["","LC/UPC", "SC/UPC","LC/APC","SC/APC","MTP Male","MTP Female","ST","FC","MT-RJ"]
        jacketRatingArray = ["","Riser","Plenum","LSZH","I/O"]
        
        fiberTypeArray = ["","Simplex","Duplex - Round","Duplex - Zip","Breakout","Loose Tube","Microarray","Ribbon"]
        errorArray = ["Error"]
        
        //Set picker delegate and datasource to self
        
        fiberTypePicker.delegate = self
        fiberTypePicker.dataSource = self
        
        //Set textfield delegates to self
        
        fiberTypeTextField.delegate = self
        fiberCountTextField.delegate = self
        jacketRatingTextField.delegate = self
        connectorSideaTextField.delegate = self
        connectorSidebTextField.delegate = self
        lengthTextField.delegate = self
        uomTextField.delegate = self
        quantityTextField.delegate = self
        
        //set toolbar for Picker
        
        
        //set inputView for selected textFields to fiberTypePicker
        
        fiberTypeTextField.inputView = fiberTypePicker
        
        fiberCountTextField.inputView = fiberTypePicker
       
        jacketRatingTextField.inputView = fiberTypePicker
 
        connectorSideaTextField.inputView = fiberTypePicker
     
        connectorSidebTextField.inputView = fiberTypePicker
  
        uomTextField.inputView = fiberTypePicker
     
        
        //enable numberpad for length and quantity fields
        
        lengthTextField.keyboardType = UIKeyboardType.numberPad
        quantityTextField.keyboardType = UIKeyboardType.numberPad
        
        //enable done button on pickerView
        
        
        
       
        
        fiberTypePicker.removeFromSuperview()

        
    }
    
   
    //return number of columns in pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //return number of rows in pickerview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if fiberTypeTextField.text == "Simplex" {
            fiberCountArray = ["","1F"]
        } else if fiberTypeTextField.text == "Duplex - Round" || fiberTypeTextField.text == "Duplex - Zip" {
            fiberCountArray = ["","2F"]
        } else if fiberTypeTextField.text == "Ribbon" {
            fiberCountArray = ["","8F", "12F", "24F", "48F", "96F", "144F"]
        } else {
            fiberCountArray = ["","1F","2F","8F","12F","24F","48F","96F","144F"]
        }
        if fiberTypeTextField.isEditing == true {
            return fiberTypeArray.count
        } else if fiberCountTextField.isEditing == true{
            return fiberCountArray.count
        } else if jacketRatingTextField.isEditing == true {
            return jacketRatingArray.count
        } else if connectorSideaTextField.isEditing || connectorSidebTextField.isEditing == true {
            return connectorArray.count
        } else if uomTextField.isEditing == true {
            return uomArray.count
        }
        return errorArray.count
    }
    
    //return row text in pickerview
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if fiberTypeTextField.isEditing == true {
            return fiberTypeArray[row]
        } else if fiberCountTextField.isEditing == true{
            return fiberCountArray[row]
        } else if jacketRatingTextField.isEditing == true {
            return jacketRatingArray[row]
        } else if connectorSideaTextField.isEditing || connectorSidebTextField.isEditing == true {
            return connectorArray[row]
        } else if uomTextField.isEditing == true {
            return uomArray[row]
        }
        return errorArray[row]
    }
    
    //return text in textfield from pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if fiberTypeTextField.isEditing == true {
            fiberTypeTextField.text = fiberTypeArray[row]
        } else if fiberCountTextField.isEditing == true{
            fiberCountTextField.text = fiberCountArray[row]
        } else if jacketRatingTextField.isEditing == true {
            jacketRatingTextField.text = jacketRatingArray[row]
        } else if connectorSideaTextField.isEditing == true {
            connectorSideaTextField.text = connectorArray[row]
        } else if connectorSidebTextField.isEditing == true {
            connectorSidebTextField.text = connectorArray[row]
        } else if uomTextField.isEditing == true {
            uomTextField.text = uomArray[row]
        }
        view.self.endEditing(true)
    }
    
 
}
