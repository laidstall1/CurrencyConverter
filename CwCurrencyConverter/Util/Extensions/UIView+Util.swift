//
//  UIView+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//
import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      self.cornerRadius
    } set {
      self.layer.cornerRadius = newValue
    }
  }
  
  var identifier: String { String(describing: self) }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      self.layer.borderWidth
    } set {
      self.layer.borderWidth = newValue
    }
  }
  
  @IBInspectable var borderColor: UIColor? {
    get {
      guard let color = layer.borderColor else {
        return nil
      }
      return UIColor(cgColor: color)
    }
    set {
      layer.borderColor = newValue?.cgColor
    }
  }
  
  func addDoneToolbar(selector: Selector, target: Any) -> UIToolbar {
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
    toolBar.sizeToFit()
    let button = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
    toolBar.setItems([button], animated: true)
    return toolBar
  }
}

extension UIView {
  fileprivate struct AssociatedObjectKeys {
    static var tapGestureRecognizer = "MyAssociatedObjectKeyForTapGesture"
  }
  
  fileprivate typealias Action = (() -> Void)?
  
  fileprivate var tapGestureRecognizerAction: Action? {
    set {
      if let newValue = newValue {
        objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
      }
    }
    get {
      let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
      return tapGestureRecognizerActionInstance
    }
  }
  
  func addTapGestureRecognizer(action: (() -> Void)?) {
    self.isUserInteractionEnabled = true
    self.tapGestureRecognizerAction = action
    let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
    self.addGestureRecognizer(tapGestureRecognizer)
  }
  
  @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
    if let action = self.tapGestureRecognizerAction {
      action?()
    } else {
      print("no action")
    }
  }
}
