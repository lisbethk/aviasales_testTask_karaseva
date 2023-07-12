//
//  RequestProcessor.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

enum RequestProcessorError: Error {
    case noData
}

protocol RequestProcessorProtocol {

    func perform<Request>(request: Request, completion: @escaping (Result<Request.Model, Error>) -> ()) where Request : RequestProtocol
}

final class RequestProcessor: RequestProcessorProtocol {

    private let requestBuilder: RequestBuilderProtocol
    private let dataParser: DataParserProtocol
    private let dispatchQueue: DispatchQueueProtocol
    private let httpTransport: HTTPTransportProtocol

    init(requestBuilder: RequestBuilderProtocol,
         dataParser: DataParserProtocol,
         dispatchQueue: DispatchQueueProtocol,
         httpTransport: HTTPTransportProtocol
    ) {
        self.requestBuilder = requestBuilder
        self.dataParser = dataParser
        self.dispatchQueue = dispatchQueue
        self.httpTransport = httpTransport
    }

    func perform<Request>(request: Request, completion: @escaping (Result<Request.Model, Error>) -> ()) where Request : RequestProtocol {
        do {
            let request = try requestBuilder.build(from: request)
            httpTransport.execute(request: request) { [weak self] data, responce, error in
                guard let self else {
                    return
                }
                self.dispatchQueue.async {
                    if let error {
                        completion(.failure(error))
                        return
                    }
                    guard let data = data else {
                        completion(.failure(RequestProcessorError.noData))
                        return
                    }
                    do {
                        let parsedData: Request.Model = try self.dataParser.parse(data: data)
                        completion(.success(parsedData))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
        } catch {
            completion(.failure(error))
        }

    }
}
