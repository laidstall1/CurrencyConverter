//
//  UIImageView+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 22/09/2025.
//

import UIKit

extension UIImageView {
  convenience init(systemName: String) {
    self.init()
    image = UIImage(systemName: systemName)?.withRenderingMode(.alwaysOriginal)
    contentMode = .scaleAspectFit
  }
}
