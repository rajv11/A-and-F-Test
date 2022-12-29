//
//  UIImage+ExtensionTests.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import XCTest
@testable import ANF_Code_Test
final class UIImage_ExtensionTests: XCTestCase {

    func test_ImageViewEXtension_DownlodFrom_ImageNotSet() {
        MockingURLProtocol.data = Data()
        URLProtocol.registerClass(MockingURLProtocol.self)

        let imageView = UIImageView()
        imageView.downloaded(from: "https://google.com") { _ in }
        XCTAssertNil(imageView.image)
    }
}
