//
//  CwCurrencyConverterTests.swift
//  CwCurrencyConverterTests
//
//  Created by DIGITAL VENTURES on 20/09/2025.
//

import XCTest
@testable import CwCurrencyConverter

final class CwCurrencyConverterTests: XCTestCase {
  var networkManager: MockNetworkManager!
  var dataSource: RateDataSourceProtocol!
  var dbManager: MockPersistenceManager!
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
      networkManager = MockNetworkManager()
      dbManager = MockPersistenceManager()
      dataSource = RateDataSourceImpl(networkManager: networkManager, apiKey: "12345", realmManager: dbManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
      networkManager = nil
      dataSource = nil
      dbManager = nil
    }
  
  func test_getExchangeRate_success() async throws {
      // Arrange
    networkManager.mockResponse = ExchangeRateResponse(
          success: true,
          timestamp: 999,
          base: "EUR",
          date: "2025-09-24",
          rates: ["USD": 1.25]
      )

      // Act
      let response = try await dataSource.getExchangeRate()

      // Assert
      XCTAssertEqual(response.rates?["USD"], 1.25)
  }

  func test_getExchangeRate_noNetwork_returnsCachedRates() async throws {
      // Arrange
    networkManager.shouldThrowNoNetwork = true
    dbManager.stubbedRates = ["USD": 1.5]

      // Act
      let response = try await dataSource.getExchangeRate()

      // Assert
      XCTAssertEqual(response.rates?["USD"], 1.5)
  }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
