//
//  MockPersistenceManager.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//
import XCTest

@testable import CwCurrencyConverter

final class MockPersistenceManager: PersistenceManager {  
  var stubbedRates: [String: Double] = [:]
  
  func saveRates(_ response: ExchangeRateResponse) {
      print("[TRACE] MockPersistenceManager.saveRates called")
  }

  func fetchRates() -> [String: Double] {
      print("[TRACE] MockPersistenceManager.fetchRates called, returning \(stubbedRates)")
      return stubbedRates
  }
}
