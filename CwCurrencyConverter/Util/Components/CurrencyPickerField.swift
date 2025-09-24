//
//  CurrencyField 2.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 22/09/2025.
//


import UIKit

class CurrencyPickerField: UITextField {
  @IBInspectable
  var hasDropdown: Bool = false {
    didSet {
      addDropdown()
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }
  
  private func addDropdown() {
    rightView = nil
    let config = UIImage.SymbolConfiguration(pointSize: 16, weight: .bold)
    let image = UIImage(systemName: "chevron.down", withConfiguration: config)?.withTintColor(.gray, renderingMode: .alwaysOriginal)
    let dropdownIV = UIImageView(image: image)
    let container = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: bounds.height))
    dropdownIV.frame = CGRect(x: 0, y: (container.bounds.height - 8) / 2, width: 20, height: 8)
    container.addSubview(dropdownIV)
    rightView = container
    rightViewMode = .always
  }
  
  private func setupView() {
    font = .systemFont(ofSize: 16, weight: .medium)
    textColor = .gray
    backgroundColor = .clear
    cornerRadius = 6
    setLeftPaddingPoints(16)
  }
}
