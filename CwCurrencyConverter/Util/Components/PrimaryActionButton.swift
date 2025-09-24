//
//  PrimaryActionButton.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 22/09/2025.
//

import UIKit

class PrimaryActionButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setup()
  }
  
  private func setup() {
    backgroundColor = .systemGreen
    cornerRadius = 4
    setTitleColor(.white, for: .normal)
    titleLabel?.font = .boldSystemFont(ofSize: 18)
  }
  
  func enable() {
    alpha = 1
  }
  
  func disable() {
    alpha = 0.4
  }
}
