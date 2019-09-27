//
//  SettingsController.swift
//  DecimalMinusDemo
//
//  Created by James Lund on 9/23/19.
//  Copyright © 2019 Jonathan Engelsma. All rights reserved.
//

import UIKit


class SettingsController: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
