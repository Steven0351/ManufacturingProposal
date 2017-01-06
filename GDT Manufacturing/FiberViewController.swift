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
    @IBOutlet weak var fiberCountPicker: UIPickerView!
    @IBOutlet weak var jacketRatingPicker: UIPickerView!
    @IBOutlet weak var connectorAPicker: UIPickerView!
    @IBOutlet weak var connectorBPicker: UIPickerView!
    @IBOutlet weak var uomPicker: UIPickerView!
    
    
    var uomArray = [""]
    var connectorArray = [""]
    var jacketRatingArray = [""]
    var fiberCountArray = [""]
    var fiberTypeArray = [""]
    var errorArray = [""]
    
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
        fiberCountPicker.delegate = self
        fiberCountPicker.dataSource = self
        fiberCountPicker.isHidden = true
        jacketRatingPicker.delegate = self
        jacketRatingPicker.dataSource = self
        jacketRatingPicker.isHidden = true
        connectorAPicker.delegate = self
        connectorAPicker.dataSource = self
        connectorAPicker.isHidden = true
        connectorBPicker.delegate = self
        connectorBPicker.dataSource = self
        connectorBPicker.isHidden = true
        uomPicker.delegate = self
        uomPicker.dataSource = self
        uomPicker.isHidden = true
        fiberTypeTextField.delegate = self
        fiberCountTextField.delegate = self
        jacketRatingTextField.delegate = self
        connectorSideaTextField.delegate = self
        connectorSidebTextField.delegate = self
        lengthTextField.delegate = self
        uomTextField.delegate = self
        quantityTextField.delegate = self
        
        /* Commenting out
        fiberTypeTextField.inputView = fiberTypePicker
        fiberCountTextField.inputView = fiberCountPicker
        jacketRatingTextField.inputView = jacketRatingPicker
        connectorSideaTextField.inputView = connectorAPicker
        connectorSidebTextField.inputView = connectorBPicker
        uomTextField.inputView = uomPicker
        */
        
        fiberTypePicker.removeFromSuperview()
        fiberCountPicker.removeFromSuperview()
        jacketRatingPicker.removeFromSuperview()
        connectorAPicker.removeFromSuperview()
        connectorBPicker.removeFromSuperview()
        uomPicker.removeFromSuperview()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if fiberTypeTextField.isSelected == true {
            return fiberCountArray.count
        } else if fiberCountTextField.isSelected == true {
            return fiberTypeArray.count
        } else if jacketRatingTextField.isSelected == true {
            return jacketRatingArray.count
        } else if connectorSideaTextField.isSelected == true || connectorSidebTextField.isSelected == true {
            return connectorArray.count
        } else if uomTextField.isSelected == true {
            return uomArray.count
        }
        return errorArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if fiberTypeTextField.isSelected == true {
            return fiberCountArray[row]
        } else if fiberCountTextField.isSelected == true {
            return fiberTypeArray[row]
        } else if jacketRatingTextField.isSelected == true {
            return jacketRatingArray[row]
        } else if connectorSideaTextField.isSelected == true || connectorSidebTextField.isSelected == true {
            return connectorArray[row]
        } else if uomTextField.isSelected == true {
            return uomArray[row]
        }
        return errorArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if fiberTypeTextField.isSelected == true {
            fiberTypeTextField.text = fiberCountArray[row]
        } else if fiberCountTextField.isSelected == true {
            fiberCountTextField.text = fiberTypeArray[row]
        } else if jacketRatingTextField.isSelected == true {
            jacketRatingTextField.text = jacketRatingArray[row]
        } else if connectorSideaTextField.isSelected == true  {
            connectorSideaTextField.text = connectorArray[row]
        } else if connectorSidebTextField.isSelected == true {
            connectorSidebTextField.text = connectorArray[row]
        } else if uomTextField.isSelected == true {
            uomTextField.text = uomArray[row]
        }
        fiberTypeTextField.text = errorArray[row]
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if fiberCountTextField.isSelected == true {
            fiberCountPicker.isHidden = false
        } else if fiberCountTextField.isSelected == true {
            fiberTypePicker.isHidden = false
        } else if jacketRatingTextField.isSelected == true {
            jacketRatingPicker.isHidden = false
        } else if connectorSideaTextField.isSelected == true  {
            connectorAPicker.isHidden = false
        } else if connectorSidebTextField.isSelected == true {
            connectorBPicker.isHidden = false
        } else if uomTextField.isSelected == true {
            uomPicker.isHidden = false
        }
        return false
    }
   
    @IBAction func addTapped(_ sender: Any) {
    }


}
