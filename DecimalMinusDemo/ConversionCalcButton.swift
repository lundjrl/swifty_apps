//
//  DecimalButton.swift
//  DecimalMinusDemo
//
//  Created by James Lund on 9/30/19.
//  Copyright © 2019 Jonathan Engelsma. All rights reserved.
//

import UIKit

class ConversionCalcButton: UIButton {

    override func awakeFromNib() {
        self.tintColor = BACKGROUND_COLOR
        self.backgroundColor = FOREGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
    }


}
