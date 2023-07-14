//
//  TicketListCellModelFactory.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import Foundation

protocol TicketDetailsInfoModelFactoryProtocol {
    func ticketListCellModel(ticket: Ticket, origin: Origin, destination: Destination) -> TicketDetailsInfoModel
}

final class TicketDetailsInfoModelFactory: TicketDetailsInfoModelFactoryProtocol {

    private let dateFormatterService: DateFormatterServiceProtocol

    init(dateFormatterService: DateFormatterServiceProtocol) {
        self.dateFormatterService = dateFormatterService
    }

    func ticketListCellModel(ticket: Ticket, origin: Origin, destination: Destination) -> TicketDetailsInfoModel {

        let departureTime = dateFormatterService.monthAndDay(from: ticket.departureDateTime)
        let departureDate = dateFormatterService.hoursAndMinutes(from: ticket.departureDateTime)
        let arrivalTime = dateFormatterService.hoursAndMinutes(from: ticket.arrivalDateTime)
        let arrivalDate = dateFormatterService.monthAndDay(from: ticket.arrivalDateTime)


        return .init(
            topLeftStackModel: .init(
                title: origin.name,
                subtitle: origin.iata,
                alignment: .leading
            ),
            topRightStackModel: .init(
                title: departureTime,
                subtitle: departureDate,
                alignment: .trailing
            ),
            bottomLeftStackModel: .init(
                title: destination.name,
                subtitle: destination.iata,
                alignment: .leading
            ),
            bottomRightStackModel: .init(
                title: arrivalTime,
                subtitle: arrivalDate,
                alignment: .trailing
            )
        )
    }
}
