//
//  TabView.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//

import UIKit

class TabView: UIStackView {
  struct TabViewModel {
    var title: String
    var isSelected = false
  }
  
  var data: [String] = [] {
    didSet {
      tabData = data.map { TabViewModel(title: $0, isSelected: false) }
      tabData?[0].isSelected = true
    }
  }
  var tabData: [TabViewModel]? {
    didSet {
      if let tabData {
        configure(data: tabData)
      }
    }
  }
  
  init(data: [String]) {
    self.data = data
    super.init(frame: .zero)
    tabData = data.map { TabViewModel(title: $0, isSelected: false) }
    tabData?[0].isSelected = true
    if let tabData {
      configure(data: tabData)
    }
    setupView()
  }
  
  required init(coder: NSCoder) {
    self.data = []
    super.init(coder: coder)
    setupView()
  }
  
  func createView(model: TabViewModel) -> UIStackView {
    let label = UILabel(text: model.title, font: .boldSystemFont(ofSize: 14), textColor: .white)
    label.alpha = model.isSelected ? 1 : 0.3
    let dotView = UIView()
    dotView.setDimensions(height: 8, width: 8)
    dotView.backgroundColor = .systemGreen
    dotView.cornerRadius = 4
    dotView.isHidden = !model.isSelected
    let stack = UIStackView(arrangedSubviews: [label, dotView])
    stack.axis = .vertical
    stack.alignment = .center
    stack.spacing = 4
    return stack
  }
  
  func configureSelected(view: UIStackView) {
    guard let label = view.arrangedSubviews.first as? UILabel else { return }
    label.alpha = 1
    view.arrangedSubviews.last?.isHidden = false
  }
  
  func configureUnselected(view: UIStackView) {
    guard let label = view.arrangedSubviews.first as? UILabel else { return }
    label.alpha = 0.3
    view.arrangedSubviews.last?.isHidden = true
  }
  
  func setupView() {
    distribution = .fillProportionally
    spacing = 30
    alignment = .top
  }
  
  func configure(data: [TabViewModel]) {
    arrangedSubviews.forEach { $0.removeFromSuperview() }
    for (_, value) in data.enumerated() {
      let view = createView(model: value)
      view.addTapGestureRecognizer { [weak self] in
        self?.arrangedSubviews.forEach { view in
          guard let sv = view as? UIStackView else { return }
          self?.configureUnselected(view: sv)
        }
        self?.configureSelected(view: view)
      }
      addArrangedSubview(view)
    }
  }
}
