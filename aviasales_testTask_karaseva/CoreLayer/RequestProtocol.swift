//
//  RequestProtocol.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

enum RequestType: String {
    case get = "GET"
}

protocol RequestProtocol {

    var path: String { get }

    var server: String { get }

    var parameters: [String: String]  { get }
    
    var requestType: RequestType { get }

    associatedtype Model: Decodable
}
