//
//  ApiService.swift
//  StaffAppAssignment
//
//  Created by Balaji Gowd on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import Foundation

fileprivate let baseURL = "https://api.myjson.com/bins/fm9rp"

fileprivate enum RequestType: String {
    case get = "GET"
}

enum ApiResponse {
    case success
    case fail
}

struct ApiErrorMessage {
    static let errorMessage = "Error Occured. Please check Internet connection. And Try Again"
}

class ApiService {
    static func getStaff(completion: @escaping (ApiResponse, String ,[Staff]?) -> ()) {
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = RequestType.get.rawValue
        URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    completion(ApiResponse.fail, error?.localizedDescription ?? ApiErrorMessage.errorMessage, nil)
                } else {
                    if let staff = try? JSONDecoder().decode(StaffList.self, from: data!) {
                        completion(ApiResponse.success, "" , staff)
                    } else {
                        completion(ApiResponse.fail, ApiErrorMessage.errorMessage, nil)
                    }
                }
            }.resume()
    }
}
