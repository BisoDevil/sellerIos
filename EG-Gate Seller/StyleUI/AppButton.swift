//
//  AppButton.swift
//  EG-Gate Seller
//
//  Created by Basem Abduallah on 4/8/19.
//  Copyright © 2019 Basem Abduallah. All rights reserved.
//

import UIKit
@IBDesignable
class AppButton: UIButton {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
               clipsToBounds = true
        layer.borderColor = UIColor(named: "MainColor")?.cgColor
        layer.cornerRadius = frame.height / 2.5
        layer.masksToBounds = true
               layer.borderWidth = 1.5
        setTitleColor(UIColor(named: "MainColor"), for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }


}
