//
//  TripDataSource.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 23/09/2025.
//

import Foundation

protocol RateDataSourceProtocol: AnyObject {
  func getExchangeRate() async throws -> ExchangeRateResponse
}

class RateDataSourceImpl: RateDataSourceProtocol {
  private let networkManager: NetworkManaging
  private let apiKey: String
  private let realmManager: PersistenceManager
  
  init(networkManager: NetworkManaging = NetworkManager(requestHandler: DefaultRequestHandler()),
       apiKey: String,
       realmManager: PersistenceManager) {
    self.networkManager = networkManager
    self.apiKey = apiKey
    self.realmManager = realmManager
  }
  
  func getExchangeRate() async throws -> ExchangeRateResponse {
    print("[TRACE] enter getExchangeRate() on thread: \(Thread.current). dataSource: \(type(of: self))")
    print("[TRACE] about to call networkManager.fetchRequest()")
    do {
      let response = try await networkManager.fetchRequest(type: ExchangeRateResponse.self, apiInformation: RateEndpoints.getRate(apiKey: apiKey))
      print("[TRACE] returned from fetchRequest(): \(response)")
      print("[TRACE] calling persistence.saveRates() type: \(type(of: realmManager))")
      realmManager.saveRates(response)
      return response
    }
    catch(let error as ApiError) {
      print("[TRACE] caught ApiError: \(error)")
      switch error {
      case .NoNetwork:
        let cachedRates = realmManager.fetchRates()
        return ExchangeRateResponse(success: true,
                                                   timestamp: nil,
                                                   base: "EUR",
                                                   date: nil,
                                                   rates: cachedRates)
        
      default: throw error
      }
    }
  }
}
