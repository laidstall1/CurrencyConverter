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
  
  func setUnderlinedTitle(_ text: String, color: UIColor = .link) {
       let attributed = NSAttributedString(
           string: text,
           attributes: [
               .underlineStyle: NSUnderlineStyle.single.rawValue,
               .foregroundColor: color
           ]
       )
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
