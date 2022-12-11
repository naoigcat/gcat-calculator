//
//  OperatorButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/07.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

internal class OperatorButton: RoundedButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuration?.attributedTitle?.font = .systemFont(ofSize: self.frame.height / 2)
        self.configuration?.attributedTitle?.baselineOffset = self.frame.height / 32
    }

    func setSelected(_ selected: Bool) {
        UIView.animate(withDuration: 1, animations: {
            if selected {
                self.configuration?.background.backgroundColor = .white
                self.configuration?.baseForegroundColor = self.defaultBackgroundColor
            } else {
                self.configuration?.background.backgroundColor = self.defaultBackgroundColor
                self.configuration?.baseForegroundColor = .white
            }
        })
    }
}
