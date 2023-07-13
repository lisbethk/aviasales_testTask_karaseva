//
//  DateFormatter.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation
protocol FlightDadeFormatterrProtocol {
    func getDate(date: String) -> Date
}

final class FlightDadeFormatter: FlightDadeFormatterrProtocol {
    let dateFormatter = DateFormatter()

    func getDate(date: String) -> Date {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        guard let formatterDate = dateFormatter.date(from: date) else { return Date() }
        return formatterDate
    }
}

