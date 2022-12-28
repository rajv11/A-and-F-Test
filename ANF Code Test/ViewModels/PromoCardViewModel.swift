//
//  PromoCardViewModel.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

 final class PromoCardViewModel {
    var promoCards: [PromoCard]?
    
    func getPromoCardsFromStub() {
        PromoCardStubServiceManager.getPromoCardStubServiceCall { result in
            switch result {
            case let .success(cards):
                self.promoCards = cards
            case .failure(_):
                debugPrint("Can not load data")
            }
        }
    }
    
    func getPromoCards(completion: @escaping (Bool) -> Void, failure: @escaping (Error) -> Void) {
        PromoCardServiceManager.getPromoCardServiceCall { result in
            switch result {
            case let .success(cards):
                self.promoCards = cards
                completion(true)
            case let .failure(error):
                debugPrint(error.localizedDescription)
                failure(error)
            }
        }
    }
}
