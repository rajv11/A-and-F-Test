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
    }
}
