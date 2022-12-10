//
//  GcatCalculatorTests.swift
//  GcatCalculatorTests
//
//  Created by naoigcat on 2019/02/06.
//  Copyright © 2019 naoigcat. All rights reserved.
//

@testable import GcatCalculator
import XCTest

internal class GcatCalculatorTests: XCTestCase {
    func testLightened() {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        #colorLiteral(red: 0.4, green: 0.6, blue: 0.8, alpha: 1).lightened()?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual((red * 10).rounded(.toNearestOrEven) / 10, 0.6)
        XCTAssertEqual((green * 10).rounded(.toNearestOrEven) / 10, 0.8)
        XCTAssertEqual((blue * 10).rounded(.toNearestOrEven) / 10, 1.0)
        XCTAssertEqual(alpha, 1)
    }
}
