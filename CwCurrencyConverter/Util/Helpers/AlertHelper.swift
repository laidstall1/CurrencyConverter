//
//  AlertHelper.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//
import UIKit

class AlertHelper {
  static func showAlert(title: String = "",
                        message: String,
                        preferredStyle: UIAlertController.Style = .alert,
                        actionText: String = "Seen",
                        withCancelAction: Bool = false,
                        cancelActionText: String = "Cancel",
                        vc: UIViewController,
                        handlerAction: ((UIAlertAction) -> Void)? = nil) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      if withCancelAction {
          alert.addAction(.init(title: cancelActionText, style: .default))
      }
      alert.addAction(UIAlertAction(
          title: NSLocalizedString(actionText, comment: ""),
                                    style: .default,
          handler: (handlerAction)))
      vc.present(alert, animated: true)
  }
  
  static func showErrorAlert(title: String = "Failed!", message: String, preferredStyle: UIAlertController.Style = .alert, actionText: String = "Seen", withCancelAction: Bool = false, vc: UIViewController, handlerAction: ((UIAlertAction) -> Void)? = nil) {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      if withCancelAction {
          alert.addAction(.init(title: "Cancel", style: .destructive))
      }
      alert.addAction(UIAlertAction(
          title: NSLocalizedString(actionText, comment: ""),
                                    style: .default,
          handler: (handlerAction)))
      vc.present(alert, animated: true)
  }
}
