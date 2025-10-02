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
  
  func fetchRequest<T>(
    type: T.Type,
    apiInformation: ApiInformation
  ) async throws -> T where T: Decodable {
    print("[TRACE] MockNetworkManager.fetchRequest called for \(T.self), shouldThrowNoNetwork=\(shouldThrowNoNetwork)")
    if shouldThrowNoNetwork {
      print("[TRACE] MockNetworkManager throwing NoNetwork")
      throw ApiError.NoNetwork
    }
    
    guard let mockResponse = mockResponse as? T else {
      fatalError("Mock response type mismatch! Expected \(T.self)")
    }
    print("[TRACE] MockNetworkManager returning mock response")
    return mockResponse
  }
}
