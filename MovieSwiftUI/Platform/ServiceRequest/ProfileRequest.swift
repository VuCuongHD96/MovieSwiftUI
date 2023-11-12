//
//  ProfileRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 06/11/2023.
//

import Foundation

class ProfileRequest: ServiceBaseRequest {

    required init(id: Int) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.profile + "\(id)"
        super.init(urlString: url, requestType: .get, body: body)
    }
}
