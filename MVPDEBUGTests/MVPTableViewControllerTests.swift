//
//  MVPTableViewControllerTests.swift
//  MVPTests
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import XCTest
@testable import MVPDEBUG

class MVPTableViewControllerTests: XCTestCase {

    var presenter: MVPTableViewPresenter!

    override func setUp() {
        presenter = MVPTableViewPresenter()
    }
    
    func testItemsCount() {
        presenter.fetchData()
        XCTAssertTrue(presenter.items.count > 0, "The number of items is not greater than 0")
    }
    
}
