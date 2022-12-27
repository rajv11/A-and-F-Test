//
//  PromoCardStubServiceManager.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

class PromoCardStubServiceManager: NSObject {
    class func getPromoCardStubServiceCall(completionHandler: @escaping (Result<[PromoCard], Error>) -> Void) {
        let jsonfileName = "exploreData"
        guard let data = Utilities.setUpJsonFile(jsonFileName: jsonfileName) else { return }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let promoCards = try? jsonDecoder.decode([PromoCard].self, from: data) else { return }
        completionHandler(.success(promoCards))
    }
}
