//
//  AllTicketsScreenModel.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

struct AllTicketsScreenModel {
    var model: [Item]

    struct Item {
        let id: String
        let price: String
        let company: String
        let numberOfTickets: Int
        let origin: String
        let originCode: String
        let destination: String
        let destinationCode: String
        let departureDate: String
        let departureTime: String
        let arrivalDate: String
        let arrivalTime: String
        let passengersCount: String
    }
}
