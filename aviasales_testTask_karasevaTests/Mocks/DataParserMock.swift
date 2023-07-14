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
    func parse<T>(data: Data) throws -> T where T : Decodable {
        return try? T(from: )
    }
}
