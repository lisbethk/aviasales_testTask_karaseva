//
//  DispatchQueueMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import Foundation
import UIKit
@testable import aviasales_testTask_karaseva

class DispatchQueueMock: DispatchQueueProtocol {

    var invokedAsync = false
    var invokedAsyncCount = 0
    var shouldInvokeAsyncWork = false

    func async(execute work: @escaping () -> Void) {
        invokedAsync = true
        invokedAsyncCount += 1
        if shouldInvokeAsyncWork {
            work()
        }
    }
}
