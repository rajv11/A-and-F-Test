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
        loadViewData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        super.updateViewConstraints()
        self.contentButtonsTableViewHeightConstraint.constant = self.contentButtonsTableView.contentSize.height
    }
    
    func loadViewData() {
        guard let promoCard = data else { return }
        topDescription.text = promoCard.topDescription
        promoTitle.text = promoCard.title
        promoMessage.text = promoCard.promoMessage
        bottomDescription.attributedText = promoCard.bottomDescription?.htmlToAttributedString
        guard let contentData = promoCard.content else { return }
        contentButtonsTableView.dataSourceArray = contentData
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
