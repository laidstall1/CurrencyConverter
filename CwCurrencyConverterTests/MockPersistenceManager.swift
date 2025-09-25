//
//  MockPersistenceManager.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//
import XCTest

@testable import CwCurrencyConverter

struct MockPersistenceManager: PersistenceManager {
  func saveRates(_ response: CwCurrencyConverter.ExchangeRateResponse) {
    
  }
  
  var stubbedRates: [String: Double] = [:]
  
  func fetchRates() -> [String : Double] {
    stubbedRates
  }
}
