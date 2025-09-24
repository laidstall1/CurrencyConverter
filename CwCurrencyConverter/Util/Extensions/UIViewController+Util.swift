//
//  UIViewController+Util.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//
import UIKit

extension UIViewController {
  private var spinnerView: SpinnerView? {
    return view.subviews.first { $0 is SpinnerView } as? SpinnerView
  }
  
  private func showLoader(message: String = "") {
    
    guard spinnerView == nil else { return }
    let spinnerAnimatedView = SpinnerView()
    view.addSubview(spinnerAnimatedView)
    spinnerAnimatedView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      spinnerAnimatedView.topAnchor.constraint(equalTo: view.topAnchor),
      spinnerAnimatedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
      spinnerAnimatedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
      spinnerAnimatedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
    ])
    spinnerAnimatedView.startSpinningAnimation(message)
  }
  
  private func hideLoader() {
    guard let loadingView = spinnerView else { return }
    loadingView.removeSpinningAnimation()
    loadingView.removeFromSuperview()
  }
  
  func showLoadingView(status: Bool) {
    status ? showLoader() : hideLoader()
  }
}
