//
//  TimeFormatterService.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

protocol DateFormatterServiceProtocol {
    func monthAndDay(from date: Date) -> String
    func hoursAndMinutes(from date: Date) -> String
}

final class DateFormatterService: DateFormatterServiceProtocol {

    let dateFormatter = DateFormatter()

//    - MARK: по международному стандарту из кода можно получить только "сент.", а не "сен", очень много говнокода ради этого
    func monthAndDay(from date: Date) -> String {
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: date)
    }
    
    func hoursAndMinutes(from date: Date) -> String {
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}
