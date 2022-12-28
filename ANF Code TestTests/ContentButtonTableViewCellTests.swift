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
    
    func testContentButtonClickedForValidUrl() {
        let model = Content(target: "https://www.google.com", title: "Click here", elementType: "hyperlink")
        XCTAssertNotNil(cell.configureCell(contentData: model))
        XCTAssertNotNil(cell.contentButtonClicked(UIButton()))
    }
    
    func testConfigureContentButtonClickedForInValidUrl() {
        let model = Content(target: nil, title: nil, elementType: nil)
        XCTAssertNotNil(cell.configureCell(contentData: model))
        XCTAssertNotNil(cell.contentButtonClicked(UIButton()))
    }
    
    func testConfigureCellForInvalidData() {
        let model = Content(target: "", title: "", elementType: "")
        XCTAssertNotNil(cell.configureCell(contentData: model))
    }
    
}
