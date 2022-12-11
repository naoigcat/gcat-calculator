//
//  RoundedButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

internal class RoundedButton: UIButton {
    var defaultBackgroundColor: UIColor?

    override func awakeFromNib() {
        super.awakeFromNib()
        if self.configuration == nil {
            self.configuration = .filled()
        }
        self.configuration?.attributedTitle = AttributedString(self.title(for: .normal) ?? "")
        self.configuration?.attributedTitle?.font = .systemFont(ofSize: self.frame.height * 2 / 5)
        self.configuration?.background.backgroundColor = self.backgroundColor
        self.configuration?.baseForegroundColor = self.tintColor
        self.configuration?.cornerStyle = .capsule
        self.defaultBackgroundColor = self.backgroundColor
        self.backgroundColor = nil
        self.setTitle(nil, for: .normal)
    }
}
