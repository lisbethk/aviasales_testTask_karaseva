//
//  DataParserMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import Foundation
import UIKit
@testable import aviasales_testTask_karaseva

class DataParserMock: DataParserProtocol {

    var invokedParse = false
    var invokedParseCount = 0
    var invokedParseParameters: (data: Data, Void)?
    var invokedParseParametersList = [(data: Data, Void)]()
    var stubbedParseError: Error?
    var stubbedParseResult: Any!

    func parse<T: Decodable>(data: Data) throws -> T {
        invokedParse = true
        invokedParseCount += 1
        invokedParseParameters = (data, ())
        invokedParseParametersList.append((data, ()))
        if let error = stubbedParseError {
            throw error
        }
        return stubbedParseResult as! T
    }
}
