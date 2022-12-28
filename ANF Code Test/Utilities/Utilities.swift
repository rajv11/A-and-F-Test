//
//  Utilities.swift
//  ANF Code Test
//
//  Created by raj on 12/27/22.
//

import Foundation

class Utilities {
    class func setUpJsonFile(jsonFileName: String?) -> Data? {
        guard let path = Bundle.main.path(forResource: jsonFileName, ofType: "json") else { return nil }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) as Data
        } catch let error {
            debugPrint(error.localizedDescription)
        }
        return nil
    }
}

class Constants {
    public static var sericeType: Bool = Bundle.main.object(forInfoDictionaryKey: "ServiceType") as! Bool
}
