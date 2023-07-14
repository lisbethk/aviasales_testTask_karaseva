//
//  aviasales_testTask_karasevaTests.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

final class SearchServiceTest: XCTestCase {

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
        requestProcessor = RequestProcessor(requestBuilder: requestProcessor,
                                            dataParser: requestBuilderMock,
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
    }
}

//
//    func testLoadImageUrls() throws {
//        // given
//        let expectedURL = "https://betterprogramming.pub/"
//        var receivedUrl: String?
//        dispatchQueueMock.shouldInvokeAsyncWork = true
//
//        // stubbs
//        jsonDecoderMock.stubbedDecodeJSONResult = [Image(id: "1",
//                                                        width: 200,
//                                                        height: 200,
//                                                        color: "black",
//                                                        urls: URLs(raw: expectedURL,
//                                                                   full: expectedURL,
//                                                                   regular: expectedURL,
//                                                                   small: expectedURL,
//                                                                   thumb: expectedURL))]
//        urlFactoryMock.stubbedGenerateURLResult = URL(string: expectedURL)
//        urlSessionMock.stubbedSendDataTaskResult = urlSessionDataTaskMock
//        urlSessionMock.stubbedSendDataTaskCompletionHandlerResult = (Data(), URLResponse(), nil)
//        configMock.stubbedApiURL = "https://betterprogramming.pub/"
//        configMock.stubbedBaseURL = "https://betterprogramming.pub/"
//
//        // when
//        unsplashPicturesService.request(completion: { result in
//            switch result {
//            case .success(let urls):
//                receivedUrl = urls?.first
//            case .failure(_):
//                return
//            }
//        })
//
//        // then
//        // проверка запуска core методов
//        XCTAssertTrue(dispatchQueueMock.invokedAsync)
//        XCTAssertTrue(jsonDecoderMock.invokedDecodeJSON)
//        XCTAssertTrue(urlFactoryMock.invokedGenerateURL)
//        XCTAssertTrue(urlSessionDataTaskMock.invokedResume)
//
//        // проверка результата
//        XCTAssertEqual(expectedURL, receivedUrl)
//    }
//}
