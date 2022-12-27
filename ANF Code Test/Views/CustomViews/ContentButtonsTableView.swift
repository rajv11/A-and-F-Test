//
//  ContentButtonsTableView.swift
//  ANF Code Test
//
//  Created by raj on 12/26/22.
//

import UIKit

class ContentButtonsTableView: UITableView {
    var dataSourceArray = [Content]() {
        didSet {
            self.layoutSubviews()
            self.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "ContentButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ContentButtonTableViewCell")
    }
}
extension ContentButtonsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension ContentButtonsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentButtonTableViewCell") as! ContentButtonTableViewCell
        cell.configureCell(contentData: dataSourceArray[indexPath.row])
        return cell
    }
}
