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
        setUI()
        loadViewData()
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
    
    func setUI() {
        guard let promoCard = data, let imageName = promoCard.backgroundImage, let image = UIImage(named: imageName) else { return }
        var aspectRatio: CGFloat = 0.0
        let isPotrait = image.size.width < image.size.height
        aspectRatio = isPotrait ? image.size.height/image.size.width: image.size.width/image.size.height
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.image = image
        backgroundImageView.contentMode = .scaleAspectFit
        
        // Adding height constraint to backgroundImageView
        let constraint = isPotrait ? backgroundImageView.widthAnchor.constraint(equalTo: backgroundImageView.heightAnchor, multiplier: 1/aspectRatio) : backgroundImageView.heightAnchor.constraint(equalTo: backgroundImageView.widthAnchor, multiplier: 1/aspectRatio)
        NSLayoutConstraint.activate([constraint])
        
        promoMessage.textColor = .gray
        bottomDescription.linkTextAttributes = [.foregroundColor: UIColor.gray]
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        super.updateViewConstraints()
        self.contentButtonsTableViewHeightConstraint.constant = self.contentButtonsTableView.contentSize.height
    }
}
