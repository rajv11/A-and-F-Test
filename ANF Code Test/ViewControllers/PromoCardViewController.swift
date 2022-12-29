//
//  PromoCardViewController.swift
//  ANF Code Test
//
//  Created by raj on 12/22/22.
//

import UIKit

class PromoCardViewController: UIViewController {
    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoMessage: UILabel!
    @IBOutlet weak var bottomDescription: UITextView!
    @IBOutlet weak var contentButtonsTableView: ContentButtonsTableView!
    @IBOutlet weak var contentButtonsTableViewHeightConstraint: NSLayoutConstraint!
    
    var data: PromoCard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadUIWithViewData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        super.updateViewConstraints()
        self.contentButtonsTableViewHeightConstraint.constant = self.contentButtonsTableView.contentSize.height
    }
    
    func loadUIWithViewData() {
        guard let promoCard = data else { return }
        topDescription.text = promoCard.topDescription
        promoTitle.text = promoCard.title
        promoMessage.text = promoCard.promoMessage
        let htmlAttributedString = promoCard.bottomDescription?.htmlToAttributedString
        let attr = [NSMutableAttributedString.Key.foregroundColor: UIColor.gray]
        let range = NSRange(location: 0, length: htmlAttributedString?.string.count ?? 0)
        htmlAttributedString?.addAttributes(attr, range: range)
        bottomDescription.attributedText = htmlAttributedString
        guard let contentData = promoCard.content else { return }
        contentButtonsTableView.dataSourceArray = contentData
        
        if promoCard.topDescription == nil {
            topDescription.removeFromSuperview()
            promoTitle.topAnchor.constraint(equalTo: self.backgroundImageView.bottomAnchor, constant: 20.0).isActive = true
        }
        
        if promoCard.promoMessage == nil {
            promoMessage.removeFromSuperview()
            bottomDescription.topAnchor.constraint(equalTo: self.promoTitle.bottomAnchor, constant: 10.0).isActive = true
            if promoCard.bottomDescription == nil {
                bottomDescription.removeFromSuperview()
                contentButtonsTableView.topAnchor.constraint(equalTo: self.promoTitle.bottomAnchor, constant: 10.0).isActive = true
            }
        }
    }

    func setupUI() {
        guard let promoCard = data else { return }
        let image = getImage(promoCard: promoCard)
        var aspectRatio: CGFloat = 0.0
        let isPotrait = image.size.width < image.size.height
        aspectRatio = isPotrait ? image.size.height/image.size.width: image.size.width/image.size.height
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundImageView.image = image
        self.backgroundImageView.contentMode = .scaleAspectFit
        
        // Adding height constraint to backgroundImageView
        let constraint = isPotrait ? self.backgroundImageView.widthAnchor.constraint(equalTo: self.backgroundImageView.heightAnchor, multiplier: 1/aspectRatio) : self.backgroundImageView.heightAnchor.constraint(equalTo: self.backgroundImageView.widthAnchor, multiplier: 1/aspectRatio)
        NSLayoutConstraint.activate([constraint])
        
        self.topDescription.textColor = .black
        self.promoTitle.textColor = .black
        self.promoMessage.textColor = .gray
        self.bottomDescription.linkTextAttributes = [.foregroundColor: UIColor.gray]
    }
    
    func getImage(promoCard: PromoCard) -> UIImage {
        if Constants.sericeType {
            guard let data = promoCard.imageData, let newImage = UIImage(data: data) else { return UIImage() }
            return newImage
        } else {
            guard let newImage = UIImage(named: promoCard.backgroundImage ?? "") else { return UIImage() }
            return newImage
        }
    }
}
