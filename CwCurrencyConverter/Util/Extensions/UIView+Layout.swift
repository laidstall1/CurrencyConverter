//
//  UIView+Layout.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//


import UIKit

public extension UIView {
  func anchor(top: NSLayoutYAxisAnchor? = nil,
                  left: NSLayoutXAxisAnchor? = nil,
                  bottom: NSLayoutYAxisAnchor? = nil,
                  right: NSLayoutXAxisAnchor? = nil,
                  paddingTop: CGFloat = 0,
                  paddingLeft: CGFloat = 0,
                  paddingBottom: CGFloat = 0,
                  paddingRight: CGFloat = 0,
                  width: CGFloat? = nil,
                  height: CGFloat? = nil) {

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }

        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }

        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }

        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }

        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }

        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    @discardableResult func centerX(inView view: UIView) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }

    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0 ){
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }

    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    func setHeight(height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    func setWidth(width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
  
  func fillSuperview(padding: UIEdgeInsets = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      if let superviewTopAnchor = superview?.topAnchor {
          topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
      }

      if let superviewBottomAnchor = superview?.bottomAnchor {
          bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
      }

      if let superviewLeadingAnchor = superview?.leadingAnchor {
          leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
      }

      if let superviewTrailingAnchor = superview?.trailingAnchor {
          trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
      }
  }

  func centerInSuperview(size: CGSize = .zero) {
      translatesAutoresizingMaskIntoConstraints = false
      if let superviewCenterXAnchor = superview?.centerXAnchor {
          centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
      }

      if let superviewCenterYAnchor = superview?.centerYAnchor {
          centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
      }

      if size.width != 0 {
          widthAnchor.constraint(equalToConstant: size.width).isActive = true
      }

      if size.height != 0 {
          heightAnchor.constraint(equalToConstant: size.height).isActive = true
      }
  }

  func centerXInSuperview() {
      translatesAutoresizingMaskIntoConstraints = false
      if let superViewCenterXAnchor = superview?.centerXAnchor {
          centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
      }
  }

  func centerYInSuperview() {
      translatesAutoresizingMaskIntoConstraints = false
      if let centerY = superview?.centerYAnchor {
          centerYAnchor.constraint(equalTo: centerY).isActive = true
      }
  }

  func constrainWidth(constant: CGFloat) {
      translatesAutoresizingMaskIntoConstraints = false
      widthAnchor.constraint(equalToConstant: constant).isActive = true
  }

  func constrainHeight(constant: CGFloat) {
      translatesAutoresizingMaskIntoConstraints = false
      heightAnchor.constraint(equalToConstant: constant).isActive = true
  }
}
