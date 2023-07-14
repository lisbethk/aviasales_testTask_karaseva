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
    func execute(request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
    }
}
