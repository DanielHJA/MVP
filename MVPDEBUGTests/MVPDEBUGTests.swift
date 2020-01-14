//
//  MVPDEBUGTests.swift
//  MVPDEBUGTests
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import XCTest
@testable import MVPDEBUG

class MVPViewControllerTests: XCTestCase {
    
    var presenter: ViewControllerPresenter!

    override func setUp() {
        presenter = ViewControllerPresenter()
    }
    
    func testIncreaseLabelCountBy0() {
        presenter.increaseLabelCountBy(0)
        XCTAssertTrue(presenter.labelCount == 0, "Count is not equal to 0")
    }

    func testIncreaseLabelBy5() {
        presenter.increaseLabelCountBy(1)
        XCTAssertTrue(presenter.labelCount == 1, "Count is not equal to 1")
    }
    
    func testIncreaseLabelBy10() {
        presenter.increaseLabelCountBy(10)
        XCTAssertTrue(presenter.labelCount == 10, "Count is not equal to 10")
    }
    
    func testIncreaseLabelBy100() {
        presenter.increaseLabelCountBy(100)
        XCTAssertTrue(presenter.labelCount == 100, "Count is not equal to 100")
    }
    
}
