//
//  RoundedButton.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

extension UIColor {

    func imageFilled() -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        defer {
            UIGraphicsEndImageContext()
        }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    func lightened(by percentage: CGFloat = 20.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage / 100, 1.0),
                           green: min(green + percentage / 100, 1.0),
                           blue: min(blue + percentage / 100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }

}

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
