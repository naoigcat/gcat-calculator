//
//  SimpleCalculatorViewController.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

internal class SimpleCalculatorViewController: UIViewController {
    enum Method {
        case add
        case subtract
        case multiply
        case divide
    }

    @IBOutlet private var inputLabel: UILabel!
    @IBOutlet private var clearButton: RoundedButton!
    @IBOutlet private var addButton: OperatorButton!
    @IBOutlet private var subtractButton: OperatorButton!
    @IBOutlet private var multiplyButton: OperatorButton!
    @IBOutlet private var divideButton: OperatorButton!

    private var input: Decimal {
        Decimal(string: self.inputLabel.text ?? "") ?? 0
    }
    private var memory: Decimal?
    private var method: Method? {
        didSet {
            self.addButton.setSelected(self.method == .add)
            self.subtractButton.setSelected(self.method == .subtract)
            self.multiplyButton.setSelected(self.method == .multiply)
            self.divideButton.setSelected(self.method == .divide)
        }
    }
    private var needsClearInput = false
    private var needsClearMethod = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputLabel.text = "0"
    }

    private func updateClearButton() {
        var attributedTitle = AttributedString(self.inputLabel.text == "0" ? "AC" : "C")
        attributedTitle.font = self.clearButton.configuration?.attributedTitle?.font
        self.clearButton.configuration?.attributedTitle = attributedTitle
    }

    @IBAction private func number(_ sender: RoundedButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }

        if self.needsClearInput {
            self.memory = self.input
            self.inputLabel.text = nil
        }
        if self.needsClearMethod {
            self.method = nil
        }
        var text = self.inputLabel.text ?? ""
        if number == "." {
            if text.contains(".") {
                return
            } else if text.isEmpty {
                text = "0"
            }
            text += number
        } else if text == "0" {
            text = number
        } else {
            text += number
        }
        self.inputLabel.text = text
        self.needsClearInput = false
        self.needsClearMethod = false
        self.updateClearButton()
    }

    @IBAction private func equal(_ sender: OperatorButton) {
        guard let method = self.method else {
            return
        }

        let input = self.input
        if let memory = self.memory {
            let (left, right) = ({ () -> (Decimal, Decimal) in
                if !self.needsClearInput, !self.needsClearMethod {
                    return (memory, input)
                } else {
                    return (input, memory)
                }
            })()
            let result = ({ () -> Decimal in
                switch method {
                case .add:
                    return left + right
                case .subtract:
                    return left - right
                case .multiply:
                    return left * right
                case .divide:
                    return left / right
                }
            })()
            self.inputLabel.text = String(describing: result)
            self.needsClearMethod = true
        }
        if !self.needsClearInput {
            self.memory = input
            self.needsClearInput = true
        }
    }

    @IBAction private func add(_ sender: OperatorButton) {
        if self.method != nil, !self.needsClearInput {
            self.equal(sender)
        } else {
            self.memory = self.input
        }
        self.needsClearInput = true
        self.needsClearMethod = false
        self.method = .add
    }

    @IBAction private func subtract(_ sender: OperatorButton) {
        if self.method != nil, !self.needsClearInput {
            self.equal(sender)
        } else {
            self.memory = self.input
        }
        self.needsClearInput = true
        self.needsClearMethod = false
        self.method = .subtract
    }

    @IBAction private func multiply(_ sender: OperatorButton) {
        if self.method != nil, !self.needsClearInput {
            self.equal(sender)
        } else {
            self.memory = self.input
        }
        self.needsClearInput = true
        self.needsClearMethod = false
        self.method = .multiply
    }

    @IBAction private func divide(_ sender: OperatorButton) {
        if self.method != nil, !self.needsClearInput {
            self.equal(sender)
        } else {
            self.memory = self.input
        }
        self.needsClearInput = true
        self.needsClearMethod = false
        self.method = .divide
    }

    @IBAction private func percent(_ sender: RoundedButton) {
        self.inputLabel.text = String(describing: self.input / 100)
        self.needsClearInput = true
    }

    @IBAction private func changeSign(_ sender: SignChangeButton) {
        let text = self.inputLabel.text ?? ""
        if text == "0" {
            self.inputLabel.text = "-0"
        } else {
            self.inputLabel.text = String(describing: self.input * -1)
        }
    }

    @IBAction private func clear(_ sender: RoundedButton) {
        if let attributedTitle = self.clearButton.configuration?.attributedTitle, String(attributedTitle.characters) == "AC" {
            self.memory = 0.0
            self.method = nil
            self.needsClearInput = false
        }
        self.inputLabel.text = "0"
        self.updateClearButton()
    }
}
