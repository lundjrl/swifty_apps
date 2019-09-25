//
//  ViewController.swift
//  DecimalMinusDemo
//
//  Created by James Lund | Zachary Thomas on 9/23/19.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate, SettingsViewControllerDelegate{
    
    // Default mode is length
    var currentMode: CalculatorMode = CalculatorMode.Length
    
    // String for focus
    var focusField: String = ""
    
    // Labels
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var conversionTitle: UILabel!
    
    // Fields
    @IBOutlet weak var inputFieldOne: DecimalMinusTextField!
    @IBOutlet weak var inputFieldTwo: DecimalMinusTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Dismiss keyboard upon foreign touch.
        let detectTouch = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
        self.inputFieldOne.delegate = self
        self.inputFieldTwo.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }

    @IBAction func clearBtn(_ sender: UIButton) {
        self.inputFieldOne.text = ""
        self.inputFieldTwo.text = ""
        dismissKeyboard()
    }
    
    
    @IBAction func calcBtn(_ sender: UIButton) {
        var input: Double
        if(self.inputFieldOne.text == "" && self.inputFieldTwo.text == ""){
        }
        else if(self.inputFieldOne.text == ""){
            focusField = "From"
            input = Double(self.inputFieldTwo.text!)!
            self.inputFieldOne.text = String(calculate(input))
        } else if(self.inputFieldTwo.text == ""){
            focusField = "To"
            input = Double(self.inputFieldOne.text!)!
            self.inputFieldTwo.text = String(calculate(input))
        }
        dismissKeyboard()
    }
    
    @IBAction func modeBtn(_ sender: UIButton) {
        if(currentMode == CalculatorMode.Length){
            // Volume
            conversionTitle.text = "Volume Conversion Calculator"
            currentMode = CalculatorMode.Volume
            fromLabel.text = "Liters"
            toLabel.text = "Gallons"
        } else {
            // Length
            conversionTitle.text = "Length Conversion Calculator"
            currentMode = CalculatorMode.Length
            fromLabel.text = "Yards"
            toLabel.text = "Meters"
        }
        self.inputFieldOne.text = ""
        self.inputFieldTwo.text = ""
        dismissKeyboard()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField == inputFieldOne){
            self.inputFieldTwo.text = ""
        }
        else if (textField == inputFieldTwo){
            self.inputFieldOne.text = ""
        }
    }
    
    func calculate(_ input: Double) -> Double{
        var convKey: LengthConversionKey
        var volKey: VolumeConversionKey
        switch currentMode {
        case CalculatorMode.Length:
            switch focusField{
            case "From":
                convKey = LengthConversionKey(toUnits: LengthUnit(rawValue: fromLabel.text!)!, fromUnits: LengthUnit(rawValue: toLabel.text!)!)
                
                return input * lengthConversionTable[convKey]!
            case "To":
                convKey = LengthConversionKey(toUnits: LengthUnit(rawValue: toLabel.text!)!, fromUnits: LengthUnit(rawValue: fromLabel.text!)!)
                
                return input * lengthConversionTable[convKey]!
            default:
                break
            }
                break
        case CalculatorMode.Volume:
            switch focusField{
            case "From":
                volKey = VolumeConversionKey(toUnits: VolumeUnit(rawValue: fromLabel.text!)!, fromUnits: VolumeUnit(rawValue: toLabel.text!)!)
                
                return input * volumeConversionTable[volKey]!
            case "To":
                volKey = VolumeConversionKey(toUnits: VolumeUnit(rawValue: toLabel.text!)!, fromUnits: VolumeUnit(rawValue: fromLabel.text!)!)
                
                return input * volumeConversionTable[volKey]!
            default:
                break
            }
            break
        default:
            break
        }
        return input
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let target = segue.destination.children[0] as? SettingsController{
            target.delegate = self
            target.currentMode = self.currentMode
            target.toLabelString = self.toLabel.text!
            target.fromLabelString = self.fromLabel.text!
            self.inputFieldOne.text = ""
            self.inputFieldTwo.text = ""
        }
    }
    
    //Need for cancel transition back to view
    @IBAction func cancelButtonPressed(_ segue: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
    
    //Need for save transition back to view
    @IBAction func saveButtonPressed(_ segue: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
        //Pass back the values changed in save 
}
    func updateData(_ fromSettingsLabel: String, _ toSettingsLabel: String){
        self.toLabel.text = toSettingsLabel
        self.fromLabel.text = fromSettingsLabel
    }

}



