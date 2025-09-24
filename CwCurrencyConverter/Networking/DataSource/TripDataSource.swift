//
//  TripDataSource.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 23/09/2025.
//

import Foundation

protocol RateDataSourceProtocol: AnyObject {
  func getRate() async throws -> ExchangeRateResponse
}

class RateDataSourceImpl: RateDataSourceProtocol {
  private let networkManager: NetworkManager
  private let apiKey: String
  
  init(networkManager: NetworkManager = NetworkManager(requestHandler: DefaultRequestHandler()),
       apiKey: String) {
    self.networkManager = networkManager
    self.apiKey = apiKey
  }
  
  func getRate() async throws -> ExchangeRateResponse {
    return try await networkManager.fetchRequest(type: ExchangeRateResponse.self, apiInformation: RateEndpoints.getRate(apiKey: apiKey))
  }
}
