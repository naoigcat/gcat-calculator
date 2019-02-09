//
//  SignChangeButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

@IBDesignable
class SignChangeButton: RoundedButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        let height = self.frame.size.height
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: height / 32, right: 0)
        self.setTitle("", for: .normal)
        let attributedText = NSMutableAttributedString(string: "\u{207A}\u{2044}\u{208B}")
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: height * 2 / 5),
            .kern: -height / 64,
            ], range: NSMakeRange(0, 1))
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: height * 2 / 5),
            .kern: -height / 64,
            ], range: NSMakeRange(1, 1))
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: height * 2 / 5),
            .baselineOffset: NSNumber(value: Float(height * 3 / 64)),
            ], range: NSMakeRange(2, 1))
        self.setAttributedTitle(attributedText, for: .normal)
    }

}
