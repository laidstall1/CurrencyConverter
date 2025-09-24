//
//  CurrencyRate.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//

import Foundation

struct CurrencyRate: Identifiable {
    let id = UUID()
    let code: String
    let value: Double
}
