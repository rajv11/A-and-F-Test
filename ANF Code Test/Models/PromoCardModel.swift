//
//  PromoCardModel.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

// MARK: - PromoDataModel
struct PromoCard: Codable {
    let title, backgroundImage: String?
    let content: [Content]?
    let promoMessage, topDescription, bottomDescription: String?
    var imageData: Data?
}

// MARK: - Content
struct Content: Codable {
    let target: String?
    let title, elementType: String?
}
