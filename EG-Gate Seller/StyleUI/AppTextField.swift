//
//  AppTextField.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/10/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
@IBDesignable
class AppTextField: SkyFloatingLabelTextField {
   
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        titleColor = UIColor(named: "MainColor") ?? .brown
        lineColor = UIColor(named: "MainColor") ?? .brown
        selectedLineColor = UIColor(named: "MainColor") ?? .brown
    }
 

}
