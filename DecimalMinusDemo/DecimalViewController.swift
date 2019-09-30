//
//  DecimalViewController.swift
//  DecimalMinusDemo
//
//  Created by James Lund on 9/30/19.
//  Copyright © 2019 Jonathan Engelsma. All rights reserved.
//

import UIKit

class DecimalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = BACKGROUND_COLOR
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
