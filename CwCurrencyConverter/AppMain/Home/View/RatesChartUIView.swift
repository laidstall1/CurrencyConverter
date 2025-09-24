//
//  RatesChartUIView.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//


import UIKit
import SwiftUI

class RatesChartUIView: UIView {
    private var hostingController: UIHostingController<RatesChartView>?

    init(rates: [String: Double]) {
        super.init(frame: .zero)
        setupChart(rates: rates)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupChart(rates: [String: Double]) {
        let chartView = RatesChartView(rates: rates)
        let hostingController = UIHostingController(rootView: chartView)
        self.hostingController = hostingController

        guard let hostView = hostingController.view else { return }
        hostView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hostView)

        NSLayoutConstraint.activate([
            hostView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hostView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hostView.topAnchor.constraint(equalTo: topAnchor),
            hostView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
