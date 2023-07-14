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
    func build(from request: any RequestProtocol) throws -> URLRequest {
        return URLRequest(url: <#URL#>)
    }
}
