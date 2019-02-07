//
//  NumberButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/07.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

@IBDesignable
class NumberButton: RoundedButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        let height = self.frame.size.height
        self.titleLabel?.font = UIFont.systemFont(ofSize: height * 2 / 5)
    }

}
