//
//  MockDataSource.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//

import XCTest

@testable import CwCurrencyConverter

class MockDataSource: RateDataSourceProtocol {
  func getExchangeRate() async throws -> CwCurrencyConverter.ExchangeRateResponse {
    CwCurrencyConverter.ExchangeRateResponse(success: true, timestamp: 12345, base: "EUR", date: "25-07-25", rates: [:])
  }
}
