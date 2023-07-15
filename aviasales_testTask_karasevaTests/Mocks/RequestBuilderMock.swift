//
//  RequestBuilderMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import Foundation
import UIKit
@testable import aviasales_testTask_karaseva

class RequestBuilderMock: RequestBuilderProtocol {

    var invokedBuild = false
    var invokedBuildCount = 0
    var invokedBuildParameters: (request: any RequestProtocol, Void)?
    var invokedBuildParametersList = [(request: any RequestProtocol, Void)]()
    var stubbedBuildParametersResult: URLRequest!

    func build(from request: any RequestProtocol) throws -> URLRequest {
        invokedBuild = true
        invokedBuildCount += 1
        invokedBuildParameters = (request, ())
        invokedBuildParametersList.append((request, ()))
        return stubbedBuildParametersResult
    }
}
