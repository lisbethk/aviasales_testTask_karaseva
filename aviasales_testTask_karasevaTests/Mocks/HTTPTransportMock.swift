//
//  HTTPTransportMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import Foundation
import UIKit
@testable import aviasales_testTask_karaseva

class HTTPTransportMock: HTTPTransportProtocol {

    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParameters: (request: URLRequest, Void)?
    var invokedExecuteParametersList = [(request: URLRequest, Void)]()
    var stubbedExecuteCompletionHandlerResult: (Data?, URLResponse?, Error?)?

    func execute(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParameters = (request, ())
        invokedExecuteParametersList.append((request, ()))
        if let result = stubbedExecuteCompletionHandlerResult {
            completionHandler(result.0, result.1, result.2)
        }
    }
}
