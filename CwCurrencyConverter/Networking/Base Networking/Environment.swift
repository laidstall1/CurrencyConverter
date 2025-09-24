//
//  Environment.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 20/09/2025.
//

import Foundation

enum Environment {
    case development
    case staging
    case production

    var baseURL: URL? {
        switch self {
        case .development:
            return URL(string: "http://data.fixer.io/")

        default:
           return nil
        }
    }
}

struct AppConfig {
    static let currentEnvironment: Environment = .development
    static let apiKey = "cf6b2433c236fed14d356e1b0db9e855"
}
