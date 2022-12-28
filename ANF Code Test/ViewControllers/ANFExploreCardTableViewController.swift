//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {
    let viewModel = PromoCardViewModel()
    var promoCards: [PromoCard]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        promoCards?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "exploreContentCell", for: indexPath)
        if let titleLabel = cell.viewWithTag(1) as? UILabel,
           let titleText = promoCards?[indexPath.row].title as? String {
            titleLabel.text = titleText
        }
        
        if let imageView = cell.viewWithTag(2) as? UIImageView,
           let url = promoCards?[indexPath.row].backgroundImage as? String {
            imageView.downloaded(from: url) { data in
                self.promoCards?[indexPath.row].imageData = data
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let promoCardVC = storyboard.instantiateViewController(withIdentifier: "PromoCardViewController") as! PromoCardViewController
        promoCardVC.data = promoCards?[indexPath.row]
        self.present(promoCardVC, animated: true)
    }
    
    func loadData() {
        viewModel.getPromoCards { status in
            if status {
                self.promoCards = self.viewModel.promoCards
            }
        } failure: { error in
            debugPrint(error.localizedDescription)
        }
    }
}
