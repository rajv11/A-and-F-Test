//
//  String+ExtensionTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test

final class String_ExtensionTests: XCTestCase {
    let htmlString = "*In stores & online. <a href=\\\"http://www.abercrombie.com/anf/media/legalText/viewDetailsText20160602_Tier_Promo_US.html\\\">Exclusions apply. See Details</a>"
    
    func test_SringExtension_For_html_String_Should_Match() {
        let actualResult = htmlString.htmlToString
        // result should be only plain text
        let expectedResult = "*In stores & online. Exclusions apply. See Details"
        XCTAssert(actualResult == expectedResult)
    }
    
}
