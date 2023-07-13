//
//  DateFormatter.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

struct ISO8601Strategy: DateValueDecodableStrategy {

    typealias RawValue = String

    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()

    static func decode(_ value: String) throws -> Date {
        guard let formatterDate = dateFormatter.date(from: value) else { throw DateFormattingError.wrongFormat }
        return formatterDate
    }
}

enum DateFormattingError: Error {
    case wrongFormat
}
