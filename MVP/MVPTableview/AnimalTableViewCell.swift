//
//  AnimalTableViewCell.swift
//  MVPDEBUG
//
//  Created by Daniel Hjärtström on 2020-01-13.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
   
    private lazy var content: BezierView = {
        let temp = BezierView()
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        return temp
    }()
    
    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.black
        temp.textAlignment = .left
        temp.minimumScaleFactor = 0.7
        temp.backgroundColor = UIColor.clear
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 0.215, green: 0.615, blue: 0, alpha: 1.00)
        addObserver(self, forKeyPath: "center", options: .new, context: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(_ object: Animal) {
        content.isHidden = false
        label.text = object.name
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let change = change {
            guard let point = change[.newKey] as? CGPoint else { return }
            
            let fixedPoint = CGPoint(x: 0 + (point.x / 2), y: point.y)
            content.moveLineWithTranslation(fixedPoint)
        }
    }
    
    
    
}
