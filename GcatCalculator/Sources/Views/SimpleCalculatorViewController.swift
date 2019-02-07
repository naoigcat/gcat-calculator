//
//  SimpleCalculatorViewController.swift
//  GcatCalculator
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

import UIKit

class SimpleCalculatorViewController: UIViewController {

    enum Method {
        case add
        case subtract
        case multiply
        case divide
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var clearButton: RoundedButton!

    private var memory: NSDecimalNumber?
    private var method: Method?
    private var needsClear = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = "0"
    }

    private func updateClearButton() {
        self.clearButton.setTitle(self.resultLabel.text == "0" ? "AC" : "C", for: .normal)
    }

    @IBAction func number(_ sender: RoundedButton) {
        guard let number = sender.titleLabel?.text else { return }

        if (self.needsClear)
        {
            self.memory = NSDecimalNumber(string: self.resultLabel.text ?? "")
            self.resultLabel.text = nil
        }
        var text = self.resultLabel.text ?? ""
        if number == "." && (text.isEmpty || text == "0") {
            text = "0" + number
        } else if text == "0" {
            text = number
        } else {
            text += number
        }
        self.resultLabel.text = text
        self.needsClear = false
        self.updateClearButton()
    }

    @IBAction func equal(_ sender: OperatorButton) {
        guard let method = self.method else { return }

        let current = NSDecimalNumber(string: self.resultLabel.text ?? "")
        if let memory = self.memory {
            let result: NSDecimalNumber
            switch (method)
            {
            case .add:
                result = memory.adding(current)
            case .subtract:
                result = memory.subtracting(current)
            case .multiply:
                result = memory.multiplying(by: current)
            case .divide:
                result = memory.dividing(by: current)
            }
            self.resultLabel.text = result.stringValue
        }
        if (!self.needsClear) {
            self.memory = current
            self.needsClear = true
        }
    }

    @IBAction func add(_ sender: OperatorButton) {
        self.method = .add
        if (!self.needsClear) {
            self.equal(sender)
        }
    }

    @IBAction func subtract(_ sender: OperatorButton) {
        self.method = .subtract
        if (!self.needsClear) {
            self.equal(sender)
        }
    }

    @IBAction func multiply(_ sender: OperatorButton) {
        self.method = .multiply
        if (!self.needsClear) {
            self.equal(sender)
        }
    }

    @IBAction func divide(_ sender: OperatorButton) {
        self.method = .divide
        if (!self.needsClear) {
            self.equal(sender)
        }
    }

    @IBAction func percent(_ sender: RoundedButton) {
        let current = NSDecimalNumber(string: self.resultLabel.text ?? "")
        self.resultLabel.text = current.dividing(by: 100).stringValue
        self.needsClear = true
    }

    @IBAction func changeSign(_ sender: SignChangeButton) {
        let text = self.resultLabel.text ?? ""
        if (text == "0") {
            self.resultLabel.text = "-0"
        } else {
            let current = NSDecimalNumber(string: self.resultLabel.text ?? "")
            self.resultLabel.text = current.multiplying(by: NSDecimalNumber(integerLiteral: -1)).stringValue
        }
    }

    @IBAction func clear(_ sender: RoundedButton) {
        if (self.clearButton.title(for: .normal) == "AC") {
            self.memory = 0.0
            self.method = nil
            self.needsClear = false
        }
        self.resultLabel.text = "0"
        self.updateClearButton()
    }

}
