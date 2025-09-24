//
//  SpinnerView.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//
import UIKit

final class SpinnerView: UIView {
  private lazy var messageLabel = UILabel.addParagraphLabel(withText: "")
    
    private lazy var shapeLayer: CAShapeLayer = CAShapeLayer(
      strokeColor: UIColor.systemGreen,
        fillColor: .clear,
        lineWidth: 5
    )
    
    private lazy var strokeAnimation = CABasicAnimation(
        keypath: "strokeEnd",
        toValue: 0.8,
        duration: 1,
        fillMode: .forwards,
        removedOnCompletion: false,
        timingFunction: CAMediaTimingFunction(name: .easeInEaseOut))
    
    private lazy var rotationAnimation = CABasicAnimation(
        keypath: "transform.rotation",
        toValue: .pi * 2,
        duration: 2,
        repeatCount: .infinity)
    
    private func setupUI() {
        addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        //position layer
        shapeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY - 40)
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
    }
    
    private var circularPath: UIBezierPath = UIBezierPath(
        arcCenter: .zero,
        radius: 30,
        startAngle: .zero,
        endAngle: .pi * 2,
        clockwise: true)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    public func startSpinningAnimation(_ message: String) {
        shapeLayer.add(strokeAnimation, forKey: "strokeAnimation")
        shapeLayer.add(rotationAnimation, forKey: "rotationAnimation")
        guard !message.isEmpty else { 
            messageLabel.isHidden = true
            return }
        messageLabel.isHidden = false
        messageLabel.text = message
    }
    
    public func removeSpinningAnimation() {
        shapeLayer.removeAnimation(forKey: "strokeAnimation")
        shapeLayer.removeAnimation(forKey: "rotationAnimation")
        shapeLayer.removeAllAnimations()
    }
    
}
