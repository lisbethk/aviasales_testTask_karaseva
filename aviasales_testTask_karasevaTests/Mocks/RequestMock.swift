//
//  RequestMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import Foundation
@testable import aviasales_testTask_karaseva

final class RequestMock: RequestProtocol {

    typealias Model = String

    var invokedPathGetter = false
    var invokedPathGetterCount = 0
    var stubbedPath: String! = ""

    var path: String {
        invokedPathGetter = true
        invokedPathGetterCount += 1
        return stubbedPath
    }

    var invokedServerGetter = false
    var invokedServerGetterCount = 0
    var stubbedServer: String! = ""

    var server: String {
        invokedServerGetter = true
        invokedServerGetterCount += 1
        return stubbedServer
    }

    var invokedParametersGetter = false
    var invokedParametersGetterCount = 0
    var stubbedParameters: [String: String]! = [:]

    var parameters: [String: String] {
        invokedParametersGetter = true
        invokedParametersGetterCount += 1
        return stubbedParameters
    }

    var invokedRequestTypeGetter = false
    var invokedRequestTypeGetterCount = 0
    var stubbedRequestType: RequestType!

    var requestType: RequestType {
        invokedRequestTypeGetter = true
        invokedRequestTypeGetterCount += 1
        return stubbedRequestType
    }
}
