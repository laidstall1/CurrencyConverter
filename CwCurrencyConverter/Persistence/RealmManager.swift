//
//  PersistenceManager.swift
//  CwCurrencyConverter
//
//  Created by DIGITAL VENTURES on 25/09/2025.
//
import RealmSwift
import Foundation

class CurrencyRateObject: Object {
  @Persisted(primaryKey: true) var currency: String = ""
  @Persisted var value: Double = 0.0
  
  convenience init(currency: String, value: Double) {
    self.init()
    self.currency = currency
    self.value = value
  }
}

protocol PersistenceManager {
  func saveRates(_ response: ExchangeRateResponse)
  func fetchRates() -> [String: Double]
}

class RealmManager: PersistenceManager {
  func saveRates(_ response: ExchangeRateResponse) {
    guard let rates = response.rates else { return }
    
    let realmRates = rates.map { CurrencyRateObject(currency: $0.key, value: $0.value) }
    do {
      let realm = try Realm()
      try realm.write {
        realm.add(realmRates, update: .modified)
      }
    } catch {
      print("Realm save error: \(error)")
    }
  }
  
  func fetchRates() -> [String: Double] {
    do {
      let realm = try Realm()
      let objects = realm.objects(CurrencyRateObject.self)
      return Dictionary(uniqueKeysWithValues: objects.map { ($0.currency, $0.value) })
    } catch {
      print("Realm fetch error: \(error)")
      return [:]
    }
  }
}
