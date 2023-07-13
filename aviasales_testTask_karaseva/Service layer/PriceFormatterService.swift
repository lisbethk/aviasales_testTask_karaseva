//
//  PriceFormatter.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

private struct Currency {
    var currencyName: String
    var currencySymbol: String {
        switch currencyName {
        case "RUB" :
            return "₽"
        default:
            return "No data"
        }
    }
}

protocol PriceFormatterServiceProtocol {
    func getFormattedPrice(price: String, currency: String) -> String
}

final class PriceFormatterService: PriceFormatterServiceProtocol {
    func getFormattedPrice(price: String, currency: String) -> String {
        var substrings: [String] = []
        var currentIndex = price.count - 1

        while currentIndex >= 0 {
            let substringEndIndex = price.index(price.endIndex, offsetBy: -currentIndex)
            let substringStartIndex = price.index(substringEndIndex, offsetBy: -3, limitedBy: price.startIndex) ?? price.startIndex
            let substring = String(price[substringStartIndex..<substringEndIndex])
            substrings.reverse()
            substrings.append(substring)
            currentIndex -= 3
        }
        let price = substrings.joined(separator:" ") + " " + Currency(currencyName: currency).currencySymbol
        return price
    }
}

