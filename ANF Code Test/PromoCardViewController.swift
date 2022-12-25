//
//  PromoCardViewController.swift
//  ANF Code Test
//
//  Created by raj on 12/22/22.
//

import UIKit

class PromoCardViewController: UIViewController {

    @IBOutlet weak var topDescription: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoMessage: UILabel!
    @IBOutlet weak var bottomDescription: UITextView!
    
    var data: [AnyHashable: Any]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let imageName = data?["backgroundImage"] as? String, let image = UIImage(named: imageName) else { return }
        var aspectRatio: CGFloat = 0.0
        let isPotrait = image.size.width < image.size.height
        aspectRatio = isPotrait ? image.size.height/image.size.width: image.size.width/image.size.height
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = image
        backgroundImage.contentMode = .scaleAspectFit
        let constraint = isPotrait ? backgroundImage.widthAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 1/aspectRatio) : backgroundImage.heightAnchor.constraint(equalTo: backgroundImage.widthAnchor, multiplier: 1/aspectRatio)
        NSLayoutConstraint.activate([constraint])
        
        topDescription.text = data?["topDescription"] as? String
        promoTitle.text = data?["title"] as? String
        promoMessage.text = data?["promoMessage"] as? String
    }
}
