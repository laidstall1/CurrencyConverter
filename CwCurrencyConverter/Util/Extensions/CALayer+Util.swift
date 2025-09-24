//
//  CALayer+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//
import UIKit

public extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.27,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 6,
    spread: CGFloat = 0)
  {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
    shouldRasterize = true
  }
}


public extension CAShapeLayer {
  convenience init(
    strokeColor: UIColor,
    fillColor: UIColor,
    lineWidth: CGFloat,
    strokeEnd: CGFloat = .zero,
    lineCap: CAShapeLayerLineCap = .round
  ) {
    self.init()
    self.strokeColor = strokeColor.cgColor
    self.fillColor = fillColor.cgColor
    self.lineWidth = lineWidth
    self.lineCap = lineCap
    self.strokeEnd = strokeEnd
  }
}

public extension CABasicAnimation {
  
  convenience init(
    keypath: String,
    toValue: CGFloat,
    duration: Double,
    fillMode: CAMediaTimingFillMode? = nil,
    removedOnCompletion: Bool? = nil,
    timingFunction: CAMediaTimingFunction? = nil,
    repeatCount: Float? = nil
  ) {
    self.init(keyPath: keypath)
    self.toValue = toValue
    self.duration = duration
    if let fillMode {
      self.fillMode = fillMode
    }
    if let removedOnCompletion {
      self.isRemovedOnCompletion = removedOnCompletion
    }
    if let timingFunction {
      self.timingFunction = timingFunction
    }
    if let repeatCount {
      self.repeatCount = repeatCount
    }
    
  }
}
