//
//  ContentButtonTableViewCell.swift
//  ANF Code Test
//
//  Created by raj on 12/25/22.
//

import UIKit

class ContentButtonTableViewCell: UITableViewCell {
    @IBOutlet weak var contentButton: UIButton!
    var urlString = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentButton.layer.cornerRadius = 0.0
        contentButton.layer.borderWidth = 3.0
        contentButton.layer.borderColor = UIColor.gray.cgColor
        contentButton.setTitleColor(.gray, for: .normal)
        contentButton.setTitleColor(.lightGray, for: .highlighted)
    }
    
    func configureCell(contentData: [AnyHashable: Any]) {
        contentButton.setTitle(contentData["title"] as? String, for: .normal)
        urlString = contentData["target"] as? String ?? ""
        
    }
    
    @IBAction func contentButtonClicked(_ sender: Any) {
        guard let url = URL(string: urlString) else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
