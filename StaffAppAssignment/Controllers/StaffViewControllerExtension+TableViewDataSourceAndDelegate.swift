//
//  StaffViewControllerExtension+TableViewDataSourceAndDelegate.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//
import UIKit

extension StaffListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = self.staffListViewModel?.items {
            return items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StaffListCell", for: indexPath) as? StaffListCell else {
            return UITableViewCell()
        }
        let itemObj = self.staffListViewModel?.items[indexPath.row]
        cell.nameLabel.text = itemObj?.name
        cell.hobbyLabel.text = itemObj?.hobby
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemObj = self.staffListViewModel?.items[indexPath.row]
        if let staff = itemObj?.staff {
            let staffDetail = StaffDetailViewModel(staff: staff)
            self.performSegue(withIdentifier: "DetailVCSegue", sender: staffDetail)
        }
    }
}
