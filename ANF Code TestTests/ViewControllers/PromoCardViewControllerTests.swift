//
//  PromoCardViewControllerTest.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test

class PromoCardViewControllerTests: XCTestCase {
    var testInstance: PromoCardViewController!
    let viewModel = PromoCardViewModel()
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        testInstance = storyboard.instantiateViewController(withIdentifier: "PromoCardViewController") as? PromoCardViewController
        
        viewModel.getPromoCardsFromStub()
        guard let promoCards = viewModel.promoCards else { return }
        testInstance.data = promoCards[0]
        _ = testInstance.view
    }
    
    func test_topDescription_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.topDescription.text, "topDescription text should not be nil")
    }
    
    func test_backgroundImageView_Image_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.backgroundImageView.image,"backgroundImageView image should not be nil")
    }
    
    func test_promoTitle_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.promoTitle.text,"promoTitle text should not be nil")
    }
    
    func test_promoMessage_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.promoMessage.text,"promoMessage text should not be nil")
    }
    
    func test_bottomDescription_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.bottomDescription.text,"bottomDescription text should not be nil")
    }
    
    func test_contentTableView_ShouldNotBeNil() {
        XCTAssertNotNil(testInstance.contentButtonsTableView,"bottomDescription text should not be nil")
    }
    
    func test_for_potraitImage() {
        testInstance.view = nil
        // this is a potraint image
        testInstance.data = viewModel.promoCards?[3]
        XCTAssertNotNil(testInstance.view)
    }
    
    func test_ViewWillLayoutSubViews() {
        XCTAssertNotNil(testInstance.viewWillLayoutSubviews())
    }
    
}
