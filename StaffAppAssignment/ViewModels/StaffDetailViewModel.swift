//
//  StaffDetailViewModel.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import Foundation

protocol StaffDetailViewModelDelegate {
    func showActivityIndicator()
    func hideActivityIndicator()
}

struct StaffDetailViewModel {
    
    var delegate: StaffDetailViewModelDelegate?
    
    private let staff: Staff
    
    init(staff: Staff) {
        self.staff = staff
    }
    
    func getRank() -> String {
        let title = staff.title
        if (title == TitleType.associate.rawValue || title == TitleType.seniorAssociate.rawValue) {
            return "Rank: \(rank.slave.rawValue)"
        } else if (title == TitleType.avp.rawValue || title == TitleType.vp.rawValue) {
            return "Rank: \(rank.boss.rawValue)"
        } else {
            return "Rank: \(rank.na)"
        }
    }
    
    func getAge() -> String {
        return "Age: \(staff.age)"
    }
    
    func getName() -> String {
        return staff.name
    }
    
    func getHobby() -> String {
        return "Hobby: \(staff.hobby ?? "-")"
    }
    
    func getImageUrl() -> URL {
        return URL(string: staff.avatar)!
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL, completion: @escaping (Data) -> ()) {
        self.delegate?.showActivityIndicator()
        getData(from: url) { data, response, error in
            self.delegate?.hideActivityIndicator()
            guard let data = data, error == nil else { return }
            completion(data)
        }
    }
    
}

enum TitleType: String {
    case associate = "Associate"
    case seniorAssociate = "Senior Associate"
    case avp = "AVP"
    case vp = "VP"
}

enum rank: String {
    case slave = "Slave"
    case boss = "Boss"
    case na = "N/A"
}
