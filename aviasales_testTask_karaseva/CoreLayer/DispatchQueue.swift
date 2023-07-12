//
//  DisoatchQueue.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void)
}

extension DispatchQueue: DispatchQueueProtocol {
    func async(execute work: @escaping () -> Void) {
        async(group: nil, qos: .background, flags: []) {
            work()
        }
    }
}
