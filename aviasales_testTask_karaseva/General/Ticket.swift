//
//  Ticket.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

struct Ticket: Decodable {
    let passengersCount: Int
    let origin: Origin
    let destination: Destination
    let results: [Results]

    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case results
    }
}

struct Origin: Decodable {
    let iata: String
    let name: String
}

struct Destination: Decodable {
    let iata: String
    let name: String
}

struct Results: Decodable {
    let id: String
    @DateValue<ISO8601Strategy> var departureDateTime: Date
    @DateValue<ISO8601Strategy> var arrivalDateTime: Date
    let price: Price
    let airline: String
    let availableTicketsCound: Int

    enum CodingKeys: String, CodingKey {
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case availableTicketsCound = "available_tickets_count"
        case price
        case airline
        case id
    }
}

struct Price: Decodable {
    let currency: String
    let value: Int
}
