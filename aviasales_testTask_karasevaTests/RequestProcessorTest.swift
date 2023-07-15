//
//  aviasales_testTask_karasevaTests.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

final class RequestProcessorTest: XCTestCase {

    var requestProcessor: RequestProcessor!
    var requestBuilderMock: RequestBuilderMock!
    var dataParserMock: DataParserMock!
    var dispatchQueueMock: DispatchQueueMock!
    var httpTransportMock: HTTPTransportMock!

    override func setUpWithError() throws {
        requestBuilderMock = .init()
        dataParserMock = .init()
        dispatchQueueMock = .init()
        httpTransportMock = .init()
        requestProcessor = RequestProcessor(requestBuilder: requestBuilderMock,
                                            dataParser: dataParserMock,
                                            dispatchQueue: dispatchQueueMock,
                                            httpTransport: httpTransportMock)
    }

    override func tearDownWithError() throws {
        requestBuilderMock = nil
        dataParserMock = nil
        dispatchQueueMock = nil
        httpTransportMock = nil
        requestProcessor = nil
    }

    func testExample() throws {
        // given
        dispatchQueueMock.shouldInvokeAsyncWork = true
        requestBuilderMock.stubbedBuildParametersResult = URLRequest(url: try XCTUnwrap(URL(string: "google.com")))
        let error = ErrorMock.error
        httpTransportMock.stubbedExecuteCompletionHandlerResult = (nil, nil, error)
        var result: Result<String, Error>?

        // when
        requestProcessor.perform(request: RequestMock()) {
            result = $0
        }
        
        // then
        XCTAssertEqual(result?.error?.localizedDescription, ErrorMock.error.localizedDescription)
    }
}

extension Result {
    var error: Error? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
