//
//  SettingsController.swift
//  DecimalMinusDemo
//
//  Created by James Lund | Zachary Thomas on 9/23/19.
//  Copyright © 2019 Jonathan Engelsma. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateData(_ :String, _ :String)
}

class SettingsController: UIViewController , UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource{ //SettingDelegate
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
    
    var selected: String = ""
    var fieldFocus: String = ""

    var volume = ["Liters", "Gallons", "Quarts"]
    var length = ["Meters", "Yards", "Miles"]
    var dataArray = [""]
    
    var pickerData = [String].self
    var selection: String = "Length"
    var delegate: SettingsViewControllerDelegate?
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var fromLabelString: String = ""
    var toLabelString: String = ""
    var currentMode: CalculatorMode = CalculatorMode.Length
    
    var viewController: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Put delegates from viewcontroller here
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        fromLabel?.text = fromLabelString
        toLabel?.text = toLabelString
        let tap = UITapGestureRecognizer(target: self, action: #selector(SettingsController.toUnitsTap(sender:)))
        toLabel.addGestureRecognizer(tap)
        let tapped = UITapGestureRecognizer(target: self, action: #selector(SettingsController.fromUnitsTap(sender:)))
        fromLabel.addGestureRecognizer(tapped)
        pickerView.isHidden = true
        
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
        if let d = self.delegate{
            d.updateData((fromLabel.text)!, (toLabel.text)!)
        }
        //Transition back to viewcontroller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func fromUnitsTap(sender: UITapGestureRecognizer) {
        pickerView.isHidden = false
        fieldFocus = "From"
    }
    
    @IBAction func toUnitsTap(sender: UITapGestureRecognizer) {
        pickerView.isHidden = false
        fieldFocus = "To"
    }
    
}
