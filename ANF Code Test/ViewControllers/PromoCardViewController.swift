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
    
    var data: [AnyHashable: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadViewData()
    }
    
    func loadViewData() {
        topDescription.text = data?["topDescription"] as? String
        promoTitle.text = data?["title"] as? String
        promoMessage.text = data?["promoMessage"] as? String
        let bottomDesc = data?["bottomDescription"] as? String
        bottomDescription.attributedText = bottomDesc?.htmlToAttributedString
        guard let contentData = data?["content"] else { return }
        contentButtonsTableView.dataSourceArray = contentData as! [[AnyHashable: Any]]
    }
    
    func setUI() {
        guard let imageName = data?["backgroundImage"] as? String, let image = UIImage(named: imageName) else { return }
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
