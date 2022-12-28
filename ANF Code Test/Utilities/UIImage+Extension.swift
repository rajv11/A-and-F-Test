//
//  UIImage+Extension.swift
//  ANF Code Test
//
//  Created by raj on 12/28/22.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit, completion: @escaping (Data?) -> Void) {
        contentMode = mode
            self.backgroundColor = .gray
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
                self?.backgroundColor = .clear
                completion(data)
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url) { data in
            completion(data)
        }
    }
}
