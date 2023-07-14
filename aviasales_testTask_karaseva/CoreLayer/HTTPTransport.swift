//
//  HTTPTransport.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol HTTPTransportProtocol {
    func execute(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: HTTPTransportProtocol {
    func execute(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        dataTask(with: request,
                 completionHandler: completionHandler).resume()
    }
}
