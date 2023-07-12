//
//  SearchRequest.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

final class SearchRequest: RequestProtocol {
    typealias Model = Ticket

    private let origin: String
    private let destination: String

    init(
        origin: String,
        destination: String
    ) {
        self.origin = origin
        self.destination = destination
    }

    var path: String { "/api/search" }
    
    var server: String { "https://nu.vsepoka.ru" }
    
    var parameters: [String : String]  {
        [
            "origin": origin,
            "destination": destination
        ]
    }

    var requestType: RequestType { .get }
}
