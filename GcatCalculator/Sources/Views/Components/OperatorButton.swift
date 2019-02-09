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

    public func setSelected(_ selected: Bool) {
        UIView.animate(withDuration: 1, animations: {
            if (selected) {
                self.setBackgroundImage(UIColor.white.imageFilled(), for: .normal)
                self.setBackgroundImage(UIColor.white.lightened()?.imageFilled(), for: .highlighted)
                self.setTitleColor(self.backgroundColor, for: .normal)
                self.setTitleColor(self.backgroundColor, for: .highlighted)
            } else {
                self.setBackgroundImage(self.backgroundColor?.imageFilled(), for: .normal)
                self.setBackgroundImage(self.backgroundColor?.lightened()?.imageFilled(), for: .highlighted)
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitleColor(UIColor.white, for: .highlighted)
            }
        })
    }
    
}
