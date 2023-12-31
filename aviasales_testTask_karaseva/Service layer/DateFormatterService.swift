//
//  dateFormatterService.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

protocol DateFormatterServiceProtocol {
    func monthAndDay(from date: Date) -> String
    func hoursAndMinutes(from date: Date) -> String
    func longMonthAndDay(from date: Date) -> String
    func weekDay(from date: Date) -> String
}

final class DateFormatterService: DateFormatterServiceProtocol {

    private let dateFormatter: DateFormatter


    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }

//    - MARK: по международному стандарту из кода можно получить только "сент", а не "сен", очень много говнокода ради этого
    func monthAndDay(from date: Date) -> String {
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date).replacingOccurrences(of: ".",
                                                                     with: "")
    }

    func longMonthAndDay(from date: Date) -> String {
        dateFormatter.dateFormat = "d MMMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
    
    func hoursAndMinutes(from date: Date) -> String {
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }

    func weekDay(from date: Date) -> String {
        dateFormatter.dateFormat = "eee"
        return dateFormatter.string(from: date).lowercased()
    }
}
