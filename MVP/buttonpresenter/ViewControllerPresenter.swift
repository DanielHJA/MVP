//
//  ViewControllerPresenter.swift
//  MVP
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

protocol ViewControllerPresenterDelegate: class {
    func setLabelValue(_ value: String)
}

class ViewControllerPresenter {
    
    weak var delegate: ViewControllerPresenterDelegate?
    var labelCount: Int = 0

    func increaseLabelCountBy(_ value: Int) {
        labelCount += value
        delegate?.setLabelValue(labelCount.stringValue)
    }
    
}
