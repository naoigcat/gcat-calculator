//
//  OperatorButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/07.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

@IBDesignable
class OperatorButton: RoundedButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        let height = self.frame.size.height
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: height * 3 / 32, right: 0)
        self.titleLabel?.font = UIFont.systemFont(ofSize: height / 2)
    }

}
