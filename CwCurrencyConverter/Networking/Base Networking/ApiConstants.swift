//
//  ApiConstants.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 20/09/2025.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
   case jsonEncoding = "application/json"
   case urlEncoding = "application/x-www-form-urlencoded"
   case formData = "multipart/form-data"
}
