//
//  ContentButtonsTableViewTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import Foundation
import XCTest
@testable import ANF_Code_Test

class ContentButtonsTableViewTests: XCTestCase {

    var tableView: ContentButtonsTableView!
    var dataSourceArray = [Content]()
    
    override func setUp() {
        super.setUp()
        tableView = ContentButtonsTableView(frame: CGRect.zero, style: .plain)
        tableView.awakeFromNib()
        let model = Content(target: "https://www.google.com", title: "Click here", elementType: "hyperlink")
        tableView.dataSourceArray = [model, model]
    }
    
    func test_numberOfRows_ShouldBeTwo() {
        let numberOfRows = tableView.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssert(numberOfRows == 2, "table view should have 2 cells")
    }
    
    func test_cellForRowAt_CellShouldNotBeNil() {
        XCTAssertNotNil(tableView.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)))
    }
    
    func test_cellForRowAt_Second_CellShouldNotBeNil() {
        XCTAssertNotNil(tableView.tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 0)))
    }
    
    func test_heightForRowAt_CellShouldBeSixty() {
        let height = tableView.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(height == 60, "row height should have 60")
    }
}
