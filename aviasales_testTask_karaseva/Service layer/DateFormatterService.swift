//
//  TimeFormatterService.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

private struct Month {
    var numberOfMonth: String
    var monthName: String {
        switch numberOfMonth {
        case "9" :
            return "сен"
        default:
            return "No data"
        }
    }
}

protocol DateFormatterServiceProtocol {
    func getFormattedDate(date: String) -> String
    func getFormattedTime(date: String) -> String
}

final class DateFormatterService: DateFormatterServiceProtocol {
    private let flightDateFormatter = FlightDadeFormatter()

    func getFormattedDate(date: String) -> String {
        let date = flightDateFormatter.getDate(date: date)
        let day = flightDateFormatter.dateFormatter.calendar.component(.day, from: date)
        let month = flightDateFormatter.dateFormatter.calendar.component(.month, from: date).description
        let monthName = Month(numberOfMonth: month).monthName
        return String("\(day) \(monthName)")
    }
    
    func getFormattedTime(date: String) -> String {
        let date = flightDateFormatter.getDate(date: date)
        let hours = flightDateFormatter.dateFormatter.calendar.component(.hour, from: date)
        let minutes = flightDateFormatter.dateFormatter.calendar.component(.minute, from: date)
        return String("\(hours):\(minutes)")
    }
}
