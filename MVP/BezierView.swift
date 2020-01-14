//
//  BezierView.swift
//  MVPDEBUG
//
//  Created by Daniel Hjärtström on 2020-01-14.
//  Copyright © 2020 Daniel Hjärtström. All rights reserved.
//

import UIKit

class BezierView: UIView {
    
     private var animationLayer: CAShapeLayer!
     private var animatedPath = UIBezierPath()
     var originPath: UIBezierPath!
     
//     private lazy var panGesture: UIPanGestureRecognizer = {
//         let temp = UIPanGestureRecognizer()
//         temp.addTarget(self, action: #selector(didPan(_:)))
//         return temp
//     }()
    
     private lazy var content: UIView = {
         let temp = UIView()
         addSubview(temp)
         temp.translatesAutoresizingMaskIntoConstraints = false
         temp.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
         temp.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
         temp.topAnchor.constraint(equalTo: topAnchor).isActive = true
         temp.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
         return temp
     }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrames()
    }
    
    private func configureFrames() {
        addLayer()
    }
    
    private func commonInit() {
        content.isHidden = false
//        content.addGestureRecognizer(panGesture)
    }
    
    private func addLayer() {
        originPath = UIBezierPath()
        originPath.move(to: CGPoint(x: 0, y: 0))
        originPath.addLine(to: CGPoint(x: content.frame.maxX, y: 0))
        originPath.addQuadCurve(to: CGPoint(x: content.frame.maxX, y: content.frame.maxY), controlPoint: CGPoint(x: content.frame.maxX, y: content.frame.midY))
        originPath.addLine(to: CGPoint(x: 0, y: content.frame.maxY))
        originPath.close()
        
        animationLayer = CAShapeLayer()
        animationLayer.path = originPath.cgPath
        animationLayer.lineWidth = 0
        animationLayer.frame = content.bounds
        animationLayer.strokeColor = UIColor.red.cgColor
        animationLayer.fillColor = UIColor.white.cgColor
        animationLayer.strokeEnd = 1.0
        content.layer.addSublayer(animationLayer)
    }
    
//    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: self)
//
//          switch sender.state {
//          case .began, .changed:
//              moveLineWithTranslation(translation)
//          case .ended:
//              animateToOrigin()
//          default:
//              break
//          }
//    }
    
    func moveLineWithTranslation(_ translation: CGPoint) {
        animatedPath = UIBezierPath()
        animatedPath.move(to: CGPoint(x: 0, y: 0))
        animatedPath.addLine(to: CGPoint(x: content.frame.maxX, y: 0))
        animatedPath.addQuadCurve(to: CGPoint(x: content.frame.maxX, y: content.frame.maxY), controlPoint: CGPoint(x: content.frame.maxX + (translation.x / 6), y: content.frame.midY))
        animatedPath.addLine(to: CGPoint(x: 0, y: content.frame.maxY))
        animatedPath.close()
        animationLayer.path = animatedPath.cgPath
        animationLayer.layoutIfNeeded()
    }
    
//    func animateToOrigin() {
//        CATransaction.begin()
//        CATransaction.setCompletionBlock({
//            self.animationLayer.path = self.originPath.cgPath
//            self.animationLayer.removeAllAnimations()
//        })
//        
//        let anim: CASpringAnimation = CASpringAnimation(keyPath: "path")
//        anim.duration = 0.5
//        anim.fillMode = .forwards
//        anim.isRemovedOnCompletion = false
//        anim.fromValue = animatedPath.cgPath
//        anim.toValue = originPath.cgPath
//        animationLayer.add(anim, forKey: "path")
//        
//        CATransaction.commit()
//    }

}
