//
//  PromoCardsServiceManager.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

class PromoCardServiceManager {
    static func getPromoCardServiceCall(completionHandler: @escaping (Result<[PromoCard], Error>) -> Void) {
        
        guard let sourceURL = URL(string: "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json") else { return }
        URLSession.shared.dataTask(with: sourceURL) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let promoCards = try jsonDecoder.decode([PromoCard].self, from: data)
                completionHandler(.success(promoCards))
            } catch let error {
                completionHandler(.failure(error))
            }
        }.resume()
    }
}
