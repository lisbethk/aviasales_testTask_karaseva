//
//  PriceFormatterService.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 13.07.2023.
//

import Foundation
import UIKit

protocol PriceFormatterServiceProtocol {
    func getFormattedPrice(price: String) -> String
}

final class PriceFormatterService: PriceFormatterServiceProtocol {
    func getFormattedPrice(price: String) -> String {

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 0
        formatter.locale = Locale(identifier: "ru_RU")

        guard let numbers = Int(price) else {return ""}
        guard let formattedAmount = formatter.string(
            from: NSNumber(value: numbers)
        ) else {
            return ""

        }
        return formattedAmount
    }
}
