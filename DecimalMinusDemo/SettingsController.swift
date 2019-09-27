//
//  SettingsController.swift
//  DecimalMinusDemo
//
//  Created by James Lund on 9/23/19.
//  Copyright © 2019 Jonathan Engelsma. All rights reserved.
// 

import UIKit

// Protocol delegate
protocol SettingsViewControllerDelegate {
    func updateData(_ :String, _ :String)
}

class SettingsController: UIViewController , UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{ //SettingDelegate

    // Setup variables
    var selected: String = ""
    var fieldFocus: String = ""

class SettingsController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Put delegates from viewcontroller here
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        
        fromLabel?.text = fromLabelString
        toLabel?.text = toLabelString
        
        // Register top for from units label
        let tap = UITapGestureRecognizer(target: self, action: #selector(SettingsController.toUnitsTap(sender:)))
        toLabel.addGestureRecognizer(tap)
        
        // Register tap for to units label
        let tapped = UITapGestureRecognizer(target: self, action: #selector(SettingsController.fromUnitsTap(sender:)))
        fromLabel.addGestureRecognizer(tapped)
        pickerView.isHidden = true
        
        // Hide picker view
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissPickerView))
        self.view.addGestureRecognizer(detectTouch)
    }
    
    @objc func dismissPickerView(){
        pickerView.isHidden = true
        if fieldFocus == "From"{
            fromLabel.text = selected
        }
        else if fieldFocus == "To"{
            toLabel.text = selected
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func vari(_ sender: UIButton) {
            dismiss(animated: true,
                    completion: nil)
        }

    @IBAction func savebtn(_ sender: UIButton) {
        //save fields one and two and assign those values to the fields on the main page.
        //Segue back to the main page with changes
        
        //Make delegates of values in viewcontroller in order to ship them over to this file so we can manipulate them. 
        
    }

        func updateData(_: String, _: String) {
        print("something")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        if currentMode == CalculatorMode.Volume{
            dataArray = volume
            return dataArray[row]
        }
        else{
            dataArray = length
            return dataArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.view.endEditing(true)
        selected = self.dataArray[row] as String
    }
    
}
