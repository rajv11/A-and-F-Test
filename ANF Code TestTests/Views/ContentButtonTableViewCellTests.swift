//
//  ContentButtonTableViewCellTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test

class ContentButtonTableViewCellTests: XCTestCase {
    var cell: ContentButtonTableViewCell!
    
    override func setUp() {
        super.setUp()
        cell = ContentButtonTableViewCell()
        let bundle = Bundle(for: ContentButtonTableViewCell.self)
        guard let customCell = bundle.loadNibNamed("ContentButtonTableViewCell", owner: nil)?.first as? ContentButtonTableViewCell else {
            return XCTFail("")
        }
        cell = customCell
    }
    
    func test_UrlString_Should_Match() {
        let model = Content(target: "https://www.abercrombie.com", title: "Click here", elementType: "hyperlink")
        XCTAssertNotNil(cell.configureCell(contentData: model))
        let actualResult = cell.urlString
        let expectedResult = model.target
        XCTAssert(actualResult == expectedResult, "Loaded urls do not match")
    }
    
    func test_Url_ShouldBeEmpty() {
        let model = Content(target: nil, title: "", elementType: "")
        XCTAssertNotNil(cell.configureCell(contentData: model))
        let actualResult = cell.urlString
        XCTAssert(actualResult.isEmpty, "Url should be empty")
    }
    
    func test_ButtonText_should_Match() {
        let model = Content(target: "https://www.abercrombie.com", title: "Click here", elementType: "hyperlink")
        XCTAssertNotNil(cell.configureCell(contentData: model))
        let actualResult = cell.contentButton.currentTitle
        let expectedResult = model.title
        XCTAssert(actualResult == expectedResult, "Text doesnt match")
    }
    
    func test_ContentButtonClicked_For_ValidUrl() {
        let model = Content(target: "https://www.abercrombie.com", title: "Click here", elementType: "hyperlink")
        XCTAssertNotNil(cell.configureCell(contentData: model))
        XCTAssertNotNil(cell.contentButtonClicked(UIButton()))
    }
    
    func test_ContentButtonClicked_For_InValidUrl() {
        let model = Content(target: nil, title: nil, elementType: nil)
        XCTAssertNotNil(cell.configureCell(contentData: model))
        XCTAssertNotNil(cell.contentButtonClicked(UIButton()))
    }
}
