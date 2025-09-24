//
//  UIStackView+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//

import UIKit

extension UIStackView {
  @IBInspectable
  var marginsRelativeAlignment: Bool {
    get {
      isLayoutMarginsRelativeArrangement
    }
    set {
      isLayoutMarginsRelativeArrangement = newValue
    }
  }
}
