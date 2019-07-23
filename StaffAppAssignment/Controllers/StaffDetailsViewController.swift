//
//  StaffDetailsViewController.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import UIKit

class StaffDetailsViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var avathar: UIImageView!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    @IBOutlet weak var rankLabel: UILabel!
    
    var staffDetailViewModel: StaffDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        staffDetailViewModel?.delegate = self
        self.setUpView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.avathar.image = nil
    }
    
    private func setUpView() {
        self.title = staffDetailViewModel?.getName()
        self.ageLabel.text = staffDetailViewModel?.getAge()
        self.hobbyLabel.text = staffDetailViewModel?.getHobby()
        self.rankLabel.text = staffDetailViewModel?.getRank()
        self.staffDetailViewModel?.downloadImage(from: (staffDetailViewModel?.getImageUrl())!, completion: { (data) in
            DispatchQueue.main.async {
                self.avathar.image = UIImage(data: data)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension StaffDetailsViewController: StaffDetailViewModelDelegate {
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
}
