//
//  StaffListViewController.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import UIKit

class StaffListViewController: UIViewController {
   
    @IBOutlet weak var staffTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var staffListViewModel: StaffListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staffTableView.estimatedRowHeight = 100;
        staffTableView.rowHeight = UITableViewAutomaticDimension
        staffListViewModel = StaffListViewModel(delegate: self)
        staffListViewModel?.getStaff()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? StaffDetailsViewController {
            if let detailViewModeObj = sender as? StaffDetailViewModel {
                vc.staffDetailViewModel = detailViewModeObj
            }
        }
    }

}

extension StaffListViewController: StaffListViewModelDelegate {
    func reloadStaffTableView() {
        DispatchQueue.main.async {
            self.staffTableView.reloadData()
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
        }
    }
    
    func showAlert(message: String) {
        
    }
    
    
}
