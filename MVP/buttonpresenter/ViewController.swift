//
//  ViewController.swift
//  MVP
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var presenter: ViewControllerPresenter = ViewControllerPresenter()

    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.text = presenter.labelCount.stringValue
        temp.textColor = UIColor.black
        temp.textAlignment = .center
        temp.minimumScaleFactor = 0.7
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 24.0, weight: .medium)
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        temp.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        return temp
    }()
    
    private lazy var content: BezierView = {
        let temp = BezierView()
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return temp
    }()
    
    private lazy var button: UIButton = {
        let temp = UIButton()
        temp.setTitle("Increase", for: .normal)
        temp.setTitleColor(UIColor.white, for: .normal)
        temp.addTarget(self, action: #selector(didTouchButton), for: .touchUpInside)
        temp.backgroundColor = UIColor.blue
        view.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        temp.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return temp
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        label.isHidden = false
//        button.isHidden = false
        view.backgroundColor = .white
        content.isHidden = false
        presenter.delegate = self
    }

    @objc private func didTouchButton() {
        presenter.increaseLabelCountBy(1)
    }
    
}

extension ViewController: ViewControllerPresenterDelegate {
    
    func setLabelValue(_ value: String) {
        label.text = value
    }
    
}
