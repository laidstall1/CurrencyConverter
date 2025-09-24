//
//  Trips.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 23/09/2025.
//

import Foundation

enum RateEndpoints: ApiInformation {
  case getRate(apiKey: String)
   
   var withApi: Bool {
      return true
   }

   var method: HTTPMethod {
      switch self {
      case .getRate:
        .get
      }
   }
   
   var path: String {
     if case .getRate = self {
        return "/latest"
      }
      return ""
   }
  
  func getQueryParameters() -> [String : String]? {
    if case .getRate(let key) = self {
      return ["access_key": key]
     }
     return nil
  }
}
