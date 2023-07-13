//
//  PriceFormatter.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation

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
        guard let currencySymbol = getSymbol(forCurrencyCode: currency) else { return "" }
        let price = substrings.joined(separator:" ") + " " + currencySymbol
        return price
    }

    func getSymbol(forCurrencyCode code: String) -> String? {
        let locale = NSLocale(localeIdentifier: code)
        if locale.displayName(forKey: .currencySymbol, value: code) == code {
            let newlocale = NSLocale(localeIdentifier: code.dropLast() + "_en")
            return newlocale.displayName(forKey: .currencySymbol, value: code)
        }
        return locale.displayName(forKey: .currencySymbol, value: code)
    }

}

