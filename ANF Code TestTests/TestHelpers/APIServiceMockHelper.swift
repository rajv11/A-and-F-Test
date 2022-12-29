//
//  APIServiceMockHelper.swift
//  ANF Code TestTests
//
//  Created by raj on 12/28/22.
//

import Foundation
class MockingURLProtocol: URLProtocol {
    static var data: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }
    
    override func startLoading() {
        if let data = Self.data {
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } else if let error = Self.error {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    override func stopLoading() {}
}
