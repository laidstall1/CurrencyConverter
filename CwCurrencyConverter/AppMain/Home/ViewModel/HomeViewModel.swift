//
//  HomeViewModel.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 24/09/2025.
//
import Foundation
import Combine

class HomeViewModel {
  var dataSource: RateDataSourceProtocol
  
  var isLoading = CurrentValueSubject<Bool, Never>(false)
  var errorMessage = PassthroughSubject<String?, Never>()
  var rates: ExchangeRateResponse?
  var subscriptions: [AnyCancellable] = []
  
  var selectedCurrency: String? {
    didSet {
      if let selectedCurrency {
        selectedCurrencyRate = rates?.rates?[selectedCurrency]
      }
    }
  }
  var selectedCurrencyRate: Double?
  
  init(dataSource: RateDataSourceProtocol) {
    self.dataSource = dataSource
  }
  
  func getRate() async {
    isLoading.send(true)
    defer { isLoading.send(false) }
    do {
      let result = try await dataSource.getRate()
      self.rates = result
    } catch {
      let errorM = (error as? LocalizedError)?.errorDescription ?? error.localizedDescription
      errorMessage.send(errorM)
    }
  }
}
