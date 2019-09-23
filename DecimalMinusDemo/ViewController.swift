//
//  ViewController.swift
//  DecimalMinusDemo
//
//  Created by Jonathan Engelsma on 9/25/15.
//  Copyright (c) 2015 Jonathan Engelsma. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
//    var yards: Double = 0.0
//    var meters: Double = 0.0
//
//    let yrd2meter = 0.9144
    
    // Default mode is length
    var currentMode: CalculatorMode = CalculatorMode.Length
    
    @IBOutlet weak var inputFieldOne: DecimalMinusTextField!
    
    @IBOutlet weak var inputFieldTwo: DecimalMinusTextField!
    
    @IBOutlet weak var conversionTitle: UILabel!
    
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
    }
    
    
    @IBAction func calcBtn(_ sender: UIButton) {
        if(self.inputFieldOne.text == ""){
            var input = Double(self.inputFieldTwo.text!)
            self.inputFieldOne.text = String(calculate(input!))
        } else {
            var input = Double(self.inputFieldOne.text!)
            self.inputFieldTwo.text = String(calculate(input!))
        }
    }
    
    @IBAction func modeBtn(_ sender: UIButton) {
        if(currentMode == CalculatorMode.Length){
            conversionTitle.text = "Volume Conversion Calculator"
            currentMode = CalculatorMode.Volume
        } else {
            conversionTitle.text = "Length Conversion Calculator"
            currentMode = CalculatorMode.Length
        }
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
        return input //* yrd2meter
    }
}

