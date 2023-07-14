//
//  SearchService.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol SearchServiceProtocol {
    func findTickets(
        origin: String,
        destination: String,
        completion: @escaping (Result<SearchRequest.Model, any Error>) -> Void
    )
}

final class SearchService: SearchServiceProtocol {

    private let requestProcessor: RequestProcessorProtocol

    init(requestProcessor: RequestProcessorProtocol) {
        self.requestProcessor = requestProcessor
    }

    func findTickets(
        origin: String,
        destination: String,
        completion: @escaping (Result<SearchRequest.Model, any Error>) -> Void
    ) {
        requestProcessor.perform(
            request: SearchRequest(
                origin: origin,
                destination: destination
            ),
            completion: completion
        )
    }
}
