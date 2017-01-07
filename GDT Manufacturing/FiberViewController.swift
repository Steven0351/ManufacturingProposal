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
    @IBOutlet weak var logoImageView: UIImageView!
    

    @IBOutlet weak var fiberTypePicker: UIPickerView!
    
    var activeTextField = UITextField()
    
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
        
        uomArray = ["Feet","Meters"]
        connectorArray = ["LC/UPC", "SC/UPC","LC/APC","SC/APC","MTP Male","MTP Female","ST","FC","MT-RJ"]
        jacketRatingArray = ["Riser","Plenum","LSZH","I/O"]
        fiberCountArray = ["1F","2F","8F","12F","24F","48F","96F","144F"]
        fiberTypeArray = ["Simplex","Duplex - Round","Duplex - Zip","Breakout","Loose Tube","Microarray","Ribbon"]
        errorArray = ["Error"]
        
        //Set delegates to self and hide pickers
        
        fiberTypePicker.delegate = self
        fiberTypePicker.dataSource = self
        fiberTypePicker.isHidden = true

        fiberTypeTextField.delegate = self
        fiberCountTextField.delegate = self
        jacketRatingTextField.delegate = self
        connectorSideaTextField.delegate = self
        connectorSidebTextField.delegate = self
        lengthTextField.delegate = self
        uomTextField.delegate = self
        quantityTextField.delegate = self
        
        
        //fiberTypeTextField.inputView = fiberTypePicker
        fiberCountTextField.inputView = fiberTypePicker
        jacketRatingTextField.inputView = fiberTypePicker
        connectorSideaTextField.inputView = fiberTypePicker
        connectorSidebTextField.inputView = fiberTypePicker
        uomTextField.inputView = fiberTypePicker
        
        fiberTypePicker.removeFromSuperview()

        
    }
    
    //Using textFieldShouldBeginEditing isn't allowing the user to click on the textField...
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool{
        if fiberTypeTextField.isEditing == true {
            activeTextField = fiberTypeTextField
            currentArray = fiberTypeArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        } else if fiberCountTextField.isEditing == true {
            activeTextField = fiberCountTextField
            currentArray = fiberCountArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        } else if jacketRatingTextField.isEditing {
            activeTextField = jacketRatingTextField
            currentArray = jacketRatingArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        } else if connectorSideaTextField.isEditing == true {
            activeTextField = connectorSideaTextField
            currentArray = connectorArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        } else if connectorSidebTextField.isEditing == true {
            activeTextField = connectorSidebTextField
            currentArray = connectorArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        } else if uomTextField.isEditing {
            activeTextField = uomTextField
            currentArray = uomArray
            fiberTypePicker.reloadAllComponents()
            fiberTypePicker.isHidden = false
        }
        return false
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
                return currentArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return currentArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
              activeTextField.text = currentArray[row]
                
    }
 
    /* Still trying to figure out the best way to utilize one pickerView for all textFields...
     
    @IBAction func fiberTypeEditing(_ sender: Any) {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
            return fiberTypeArray.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return fiberTypeArray[row]
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            fiberTypeTextField.text = fiberTypeArray[row]
        }
        
    }

    @IBAction func fiberCountEditing(_ sender: Any) {
    }
   
    @IBAction func jacketRatingEditing(_ sender: Any) {
    }
    
    @IBAction func connectorSideaEditing(_ sender: Any) {
    }
    
    @IBAction func connectorSidebEditing(_ sender: Any) {
    }
    
    @IBAction func uomEditing(_ sender: Any) {
    }
    */
    
    
    @IBAction func addTapped(_ sender: Any) {
    }


}
