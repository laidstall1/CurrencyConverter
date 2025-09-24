//
//  CurrencyField.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 21/09/2025.
//
import UIKit

class CurrencyField: UITextField {
  
  @IBInspectable
  var currency: String = "" {
    didSet {
      addCurrencyLabel()
    }
  }
  
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
  
  private func addCurrencyLabel() {
    rightView = nil
    let label = UILabel.addParagraphLabel(withText: currency)
    let padding: CGFloat = 8
    let width = label.intrinsicContentSize.width + padding * 2
    let container = UIView(frame: CGRect(x: 0, y: 0, width: width, height: bounds.height))

    label.frame = CGRect(
      x: 0,
      y: (container.bounds.height - label.intrinsicContentSize.height) / 2,
      width: label.intrinsicContentSize.width,
      height: label.intrinsicContentSize.height
    )
    container.addSubview(label)
    rightView = container
    rightViewMode = .always
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
    backgroundColor = .secondarySystemBackground
    cornerRadius = 6
    borderStyle = .none
    setLeftPaddingPoints(16)
  }
  
  private func setupDropdownField() {
    
  }
}
