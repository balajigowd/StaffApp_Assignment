//
//  StaffModel.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import Foundation

// MARK: - Staff Model

struct Staff: Codable {
    
    let id: Int
    
    let name, title: String
    
    let age: Int
    
    let hobby: String?
    
    let avatar: String
    
}

typealias StaffList = [Staff]
