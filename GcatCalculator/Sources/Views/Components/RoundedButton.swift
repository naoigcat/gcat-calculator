//
//  RoundedButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setBackgroundImage(self.backgroundColor?.imageFilled(), for: .normal)
        self.setBackgroundImage(self.backgroundColor?.lightened()?.imageFilled(), for: .highlighted)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let height = self.frame.size.height
        self.layer.cornerRadius = height / 2
    }

}
