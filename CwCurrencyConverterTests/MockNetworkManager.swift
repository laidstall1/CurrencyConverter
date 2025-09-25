//
//  MockNetworkManager.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//
import XCTest

@testable import CwCurrencyConverter

class MockNetworkManager: NetworkManaging {
    var shouldThrowNoNetwork = false
    var mockResponse: ExchangeRateResponse?
  
    func fetchRequest<T>(type: T.Type, apiInformation: ApiInformation) async throws -> T where T : Decodable {
        if shouldThrowNoNetwork {
            throw ApiError.NoNetwork
        }
      let mock = mockResponse ?? ExchangeRateResponse(success: true,
                                        timestamp: 123,
                                        base: "EUR",
                                        date: "2025-09-24",
                                        rates: ["USD": 1.1])
        return mock as! T
    }
}
