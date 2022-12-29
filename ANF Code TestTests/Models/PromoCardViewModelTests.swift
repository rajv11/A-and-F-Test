//
//  PromoCardViewModelTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test

final class PromoCardViewModelTests: XCTestCase {
    let viewModel = PromoCardViewModel()
    
    func test_getPromoCards_shouldReturnValidData_For_ServiceType_True() {
        Constants.sericeType = true
        let jsonfileName = "exploreData"
        guard let data = Utilities.setUpJsonFile(jsonFileName: jsonfileName) else { return }
        MockingURLProtocol.data = data
        URLProtocol.registerClass(MockingURLProtocol.self)
        let expectation = self.expectation(description: "Fetched data")
        
        viewModel.getPromoCards { status in
            if status {
                let expectedImageName = "anf-20160527-app-m-shirts.jpg"
                guard let actualImageName = self.viewModel.promoCards?[0].backgroundImage else { return }
                print(actualImageName)
                XCTAssert(expectedImageName == actualImageName, "backgroundImage name should match")
                expectation.fulfill()
            }
        } failure: { error in
            debugPrint(error.localizedDescription)
        }
        waitForExpectations(timeout: 10)
    }
    
    func test_getPromoCards_shouldReturnError_For_ServiceType_True() {
        Constants.sericeType = true
        MockingURLProtocol.data = Data()
        URLProtocol.registerClass(MockingURLProtocol.self)
        let expectation = self.expectation(description: "Test with empty data")
        
        viewModel.getPromoCards { _ in } failure: { error in
            XCTAssertNotNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}

