//
//  ANFExploreCardTableViewController.swift
//  ANF Code Test
//

import UIKit

class ANFExploreCardTableViewController: UITableViewController {
    private var promoCards: [PromoCard]? {
        let promoCardViewModel = PromoCardViewModel()
        promoCardViewModel.getPromoCardsFromStub()
        return promoCardViewModel.promoCards
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
           let name = promoCards?[indexPath.row].backgroundImage as? String,
           let image = UIImage(named: name) {
            imageView.image = image
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            //Passing selected PromoCard object to PromoCardViewController
            let detailVC = segue.destination as! PromoCardViewController
            detailVC.data = promoCards?[self.tableView.indexPathForSelectedRow!.row]
            
        }
    }
}
