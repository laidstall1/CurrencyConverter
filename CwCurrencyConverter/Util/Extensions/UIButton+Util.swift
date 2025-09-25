//
//  UIButton+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//

import UIKit

extension UIButton {
  convenience init(text: String, textColor: UIColor? = nil, bgColor: UIColor? = nil) {
    self.init(type: .custom)
    setTitle(text, for: .normal)
    titleLabel?.text = text
    titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    setTitleColor(textColor, for: .normal)
    backgroundColor = bgColor
  }
  
  func underline() {
         guard let title = title(for: .normal),
               let font = titleLabel?.font else { return }
         
         let attributes: [NSAttributedString.Key: Any] = [
             .underlineStyle: NSUnderlineStyle.single.rawValue,
             .foregroundColor: titleColor(for: .normal) ?? .systemBlue,
             .font: font
         ]
         
         let attributed = NSAttributedString(string: title, attributes: attributes)
         setAttributedTitle(attributed, for: .normal)
     }
  
  func setUnderlinedTitle(_ title: String, color: UIColor? = nil, state: UIControl.State = .normal) {
         let font = titleLabel?.font ?? UIFont.systemFont(ofSize: UIFont.buttonFontSize)
         let textColor = color ?? titleColor(for: state) ?? tintColor ?? .label

         let attrs: [NSAttributedString.Key: Any] = [
             .underlineStyle: NSUnderlineStyle.single.rawValue,
             .font: font,
             .foregroundColor: textColor
         ]

         let attributed = NSAttributedString(string: title, attributes: attrs)
         setAttributedTitle(attributed, for: state)
     }
  
  static func createButtonWithUnderlinedText(_ text: String, textColor: UIColor) -> UIButton {
    let button = UIButton(text: text, textColor: textColor, bgColor: nil)
    button.titleLabel?.underline()
    button.setHeight(height: 30)
    return button
  }
}
