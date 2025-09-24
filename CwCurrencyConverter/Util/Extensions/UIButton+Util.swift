//
//  UIButton+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//

import UIKit

extension UIButton {
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
}
