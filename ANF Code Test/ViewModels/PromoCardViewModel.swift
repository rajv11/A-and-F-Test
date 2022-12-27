//
//  PromoCardViewModel.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

final class PromoCardViewModel: NSObject {
    var promoCards: [PromoCard]?
    
    func getPromoCardsFromStub() {
        PromoCardStubServiceManager.getPromoCardStubServiceCall { result in
            switch result {
            case let .success(cards):
                self.promoCards = cards
            case .failure(_):
                debugPrint("Can nnot load data")
            }
        }
    }
}
