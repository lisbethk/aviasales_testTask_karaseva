//
//  DateValue.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

protocol DateValueDecodableStrategy {
    associatedtype RawValue: Decodable

    static func decode(_ value: RawValue) throws -> Date
}

@propertyWrapper
struct DateValue<Formatter: DateValueDecodableStrategy>: Decodable {
    private let value: Formatter.RawValue
    var wrappedValue: Date

    init(from decoder: Decoder) throws {
        self.value = try Formatter.RawValue(from: decoder)
        self.wrappedValue = try Formatter.decode(value)
    }
}
