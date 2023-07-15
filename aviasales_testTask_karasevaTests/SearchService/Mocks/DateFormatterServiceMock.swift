//
//  SearchRequestResponceMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

class DateFormatterServiceMock: DateFormatterServiceProtocol {

    var invokedMonthAndDay = false
    var invokedMonthAndDayCount = 0
    var invokedMonthAndDayParameters: (date: Date, Void)?
    var invokedMonthAndDayParametersList = [(date: Date, Void)]()
    var stubbedMonthAndDayResult: String! = ""

    func monthAndDay(from date: Date) -> String {
        invokedMonthAndDay = true
        invokedMonthAndDayCount += 1
        invokedMonthAndDayParameters = (date, ())
        invokedMonthAndDayParametersList.append((date, ()))
        return stubbedMonthAndDayResult
    }

    var invokedHoursAndMinutes = false
    var invokedHoursAndMinutesCount = 0
    var invokedHoursAndMinutesParameters: (date: Date, Void)?
    var invokedHoursAndMinutesParametersList = [(date: Date, Void)]()
    var stubbedHoursAndMinutesResult: String! = ""

    func hoursAndMinutes(from date: Date) -> String {
        invokedHoursAndMinutes = true
        invokedHoursAndMinutesCount += 1
        invokedHoursAndMinutesParameters = (date, ())
        invokedHoursAndMinutesParametersList.append((date, ()))
        return stubbedHoursAndMinutesResult
    }

    var invokedLongMonthAndDay = false
    var invokedLongMonthAndDayCount = 0
    var invokedLongMonthAndDayParameters: (date: Date, Void)?
    var invokedLongMonthAndDayParametersList = [(date: Date, Void)]()
    var stubbedLongMonthAndDayResult: String! = ""

    func longMonthAndDay(from date: Date) -> String {
        invokedLongMonthAndDay = true
        invokedLongMonthAndDayCount += 1
        invokedLongMonthAndDayParameters = (date, ())
        invokedLongMonthAndDayParametersList.append((date, ()))
        return stubbedLongMonthAndDayResult
    }

    var invokedWeekDay = false
    var invokedWeekDayCount = 0
    var invokedWeekDayParameters: (date: Date, Void)?
    var invokedWeekDayParametersList = [(date: Date, Void)]()
    var stubbedWeekDayResult: String! = ""

    func weekDay(from date: Date) -> String {
        invokedWeekDay = true
        invokedWeekDayCount += 1
        invokedWeekDayParameters = (date, ())
        invokedWeekDayParametersList.append((date, ()))
        return stubbedWeekDayResult
    }
}
