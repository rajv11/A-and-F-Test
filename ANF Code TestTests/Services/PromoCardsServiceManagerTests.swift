//
//  PromoCardsServiceManagerTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test

final class PromoCardsServiceManagerTests: XCTestCase {
    
    func test_getPromoCardServiceCall_shouldReturnValidData() {
        let jsonfileName = "exploreData"
        guard let data = Utilities.setUpJsonFile(jsonFileName: jsonfileName) else { return }
        MockingURLProtocol.data = data
        URLProtocol.registerClass(MockingURLProtocol.self)
        let expectation = self.expectation(description: "Fetched data")
        PromoCardServiceManager.getPromoCardServiceCall { result in
            switch result {
            case let .success(cards):
                let expectedImageName = "anf-20160527-app-m-shirts.jpg"
                guard let actualImageName = cards[0].backgroundImage else { return }
                print(actualImageName)
                XCTAssert(expectedImageName == actualImageName, "backgroundImage name should match")
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func test_getPromoCardServiceCall_shouldReturnError() {
        MockingURLProtocol.data = Data()
        URLProtocol.registerClass(MockingURLProtocol.self)
        let expectation = self.expectation(description: "Test with empty data")
        PromoCardServiceManager.getPromoCardServiceCall { result in
            switch result {
            case .success(_): break
            case let .failure(error):
                debugPrint(error.localizedDescription)
                XCTAssertNotNil(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}
