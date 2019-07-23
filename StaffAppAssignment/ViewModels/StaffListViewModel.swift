//
//  StaffListViewModel.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import Foundation

protocol StaffListViewModelDelegate {
    func reloadStaffTableView()
    func showActivityIndicator()
    func hideActivityIndicator()
    func showAlert(message: String)
}

class StaffListViewModel {
    var delegate: StaffListViewModelDelegate?
    var items = [StaffCellViewModel]()
    
    init(delegate: StaffListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func getStaff() {
        self.delegate?.showActivityIndicator()
        ApiService.getStaff { (response, message, staffList) in
            self.delegate?.hideActivityIndicator()
            if response == .success {
                if let staff = staffList {
                    self.parseStaff(staff: staff)
                } else {
                    self.delegate?.showAlert(message: "Wrong Data!")
                }
            } else {
                self.delegate?.showAlert(message: message)
            }
        }
    }
    
    private func parseStaff(staff: [Staff]) {
        self.items.removeAll()
        for obj in staff {
            var staffCellViewModelObj = StaffCellViewModel()
            staffCellViewModelObj.name = obj.name
            if let hobby = obj.hobby {
                staffCellViewModelObj.hobby = hobby
                staffCellViewModelObj.isHavingHobby = true
            } else {
                staffCellViewModelObj.isHavingHobby = false
            }
            staffCellViewModelObj.staff = obj
            self.items.append(staffCellViewModelObj)
        }
        self.delegate?.reloadStaffTableView()
    }
}
