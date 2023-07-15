//
//  DateFormatterServiceMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

class PriceFormatterServiceMock: PriceFormatterServiceProtocol {

    var invokedGetFormattedPrice = false
    var invokedGetFormattedPriceCount = 0
    var invokedGetFormattedPriceParameters: (price: String, currency: String)?
    var invokedGetFormattedPriceParametersList = [(price: String, currency: String)]()
    var stubbedGetFormattedPriceResult: String! = ""

    func getFormattedPrice(price: String, currency: String) -> String {
        invokedGetFormattedPrice = true
        invokedGetFormattedPriceCount += 1
        invokedGetFormattedPriceParameters = (price, currency)
        invokedGetFormattedPriceParametersList.append((price, currency))
        return stubbedGetFormattedPriceResult
    }
}
