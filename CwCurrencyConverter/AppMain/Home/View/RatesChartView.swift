//
//  RatesChartView.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//


import SwiftUI
import Charts

struct RatesChartView: View {
    let rates: [String: Double]

    var body: some View {
        let topRates = rates
            .sorted { $0.value < $1.value }
            .prefix(10)
            .map { CurrencyRate(code: $0.key, value: $0.value) }

        Chart(topRates) { rate in
            BarMark(
                x: .value("Currency", rate.code),
                y: .value("Value", rate.value)
            )
        }
        .frame(height: 300)
        .padding()
    }
}
