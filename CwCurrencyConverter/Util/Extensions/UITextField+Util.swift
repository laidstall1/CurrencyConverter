//
//  UITextField+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//
import UIKit

extension UITextField {
  convenience init(_ placeholder: String? = nil) {
    self.init(frame: .zero)
    self.placeholder = placeholder
    font = .systemFont(ofSize: 16, weight: .medium)
    textColor = .gray
    backgroundColor = .systemGroupedBackground
    layer.cornerRadius = 8
    translatesAutoresizingMaskIntoConstraints = false
    setHeight(height: 55)
    setLeftPaddingPoints(18)
  }
  
  func setLeftPaddingPoints(_ amount: CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.leftView = paddingView
    self.leftViewMode = .always
  }

  func setRightPaddingPoints(_ amount: CGFloat) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
    self.rightView = paddingView
    self.rightViewMode = .always
  }
  
  func numbersOnly() {
      self.keyboardType = .numberPad
      addTarget(self, action: #selector(restrictInput), for: .editingChanged)
  }
  
  @objc
  private func restrictInput() {
    if let text = self.text {
      self.text = text.filter { $0.isNumber }
    }
  }
}
