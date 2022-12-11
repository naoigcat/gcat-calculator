//
//  SignChangeButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

internal class SignChangeButton: RoundedButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configuration?.titlePadding = self.frame.height / 32
        var attributedTitle = AttributedString("\u{207A}\u{2044}\u{208B}")
        if let range = attributedTitle.range(of: "\u{207A}") {
            attributedTitle[range].font = .systemFont(ofSize: self.frame.height * 2 / 5)
            attributedTitle[range].kern = -self.frame.height / 64
        }
        if let range = attributedTitle.range(of: "\u{2044}") {
            attributedTitle[range].font = .systemFont(ofSize: self.frame.height * 2 / 5)
            attributedTitle[range].kern = -self.frame.height / 64
        }
        if let range = attributedTitle.range(of: "\u{208B}") {
            attributedTitle[range].font = .systemFont(ofSize: self.frame.height * 2 / 5)
            attributedTitle[range].kern = -self.frame.height / 64
        }
        self.configuration?.attributedTitle = attributedTitle
    }
}
