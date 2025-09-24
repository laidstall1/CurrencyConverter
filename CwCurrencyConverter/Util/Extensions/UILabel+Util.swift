//
//  UILabel+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//
import UIKit

extension UILabel {
  convenience init(text: String, font: UIFont, textColor: UIColor, numberOfLines: Int = 0) {
    self.init()
    self.font = font
    self.text = text
    self.textColor = textColor
    self.numberOfLines = numberOfLines
    textAlignment = .left
    adjustsFontSizeToFitWidth = true
  }
  
  static func addHeaderLabel(withText text: String, color: UIColor = .gray, size: CGFloat = 20, numberOfLines: Int = 2) -> UILabel {
     UILabel(text: text, font: .boldSystemFont(ofSize: size), textColor: color, numberOfLines: numberOfLines)
  }
  
  static func addParagraphLabel(withText text: String, color: UIColor = .gray, size: CGFloat = 16) -> UILabel {
    UILabel(text: text, font: .systemFont(ofSize: size, weight: .medium), textColor: color, numberOfLines: 0)
  }
  
  func underline() {
    if let textString = self.text {
      let attributedString = NSMutableAttributedString(string: textString)
      
      attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: NSRange(location: 0, length: textString.count))
      self.attributedText = attributedString
    }
  }
}
