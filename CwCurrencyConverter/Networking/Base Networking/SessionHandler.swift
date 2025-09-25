//
//  VkSessionHandler.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 23/09/2025.
//

import Alamofire
import Foundation

struct CwSessionHandler {
   static let sessionManager: Session = {
       let configuration = URLSessionConfiguration.af.default
       configuration.timeoutIntervalForRequest = 30
       return Session(
           configuration: configuration,
           interceptor: nil,
           eventMonitors: [NetworkLogger()])
   }()
}
