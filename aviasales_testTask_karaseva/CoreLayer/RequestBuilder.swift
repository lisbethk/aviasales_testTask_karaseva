//
//  RequestBuilder.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

enum RequestBuilderError: Error {
    case invalidUrl
    case invalidRequest
}

protocol RequestBuilderProtocol {
    func build(from request: any RequestProtocol) throws -> URLRequest
}

final class RequestBuilder: RequestBuilderProtocol {
    func build(from request: any RequestProtocol) throws -> URLRequest {

        guard var urlComponents = URLComponents(string: request.server) else {
            throw RequestBuilderError.invalidUrl
        }

        urlComponents.path = request.path

        urlComponents.queryItems = request.parameters.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }

        guard let url = urlComponents.url else {
            throw RequestBuilderError.invalidRequest
        }

        var urlRequest = URLRequest(url: url)

        urlRequest.httpMethod = request.requestType.rawValue

        return urlRequest
    }
}
