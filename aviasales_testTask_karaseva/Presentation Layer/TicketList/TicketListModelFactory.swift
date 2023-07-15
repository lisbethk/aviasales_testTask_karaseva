//
//  TicketListModelFactory.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import Foundation
import SwiftUI

protocol TicketListModelFactoryProtocol {
    func makeTicketListViewModel(
        model: SearchRequestResponceModel,
        tapHandler: @escaping (Ticket) -> ()
    ) -> TicketListScrollModel
}

final class TicketListModelFactory: TicketListModelFactoryProtocol {

    private let priceFormatter: PriceFormatterServiceProtocol
    private let dateFormatterService: DateFormatterServiceProtocol
    private let ticketDetailsInfoModelFactory: TicketDetailsInfoModelFactoryProtocol

    init(dateFormatterService: DateFormatterServiceProtocol,
         priceFormatter: PriceFormatterServiceProtocol,
         ticketDetailsInfoModelFactory: TicketDetailsInfoModelFactoryProtocol) {
        self.dateFormatterService = dateFormatterService
        self.priceFormatter = priceFormatter
        self.ticketDetailsInfoModelFactory = ticketDetailsInfoModelFactory
    }

    func makeTicketListViewModel(
        model: SearchRequestResponceModel,
        tapHandler: @escaping (Ticket) -> ()
    ) -> TicketListScrollModel {

        let sortedTickets = model.tickets.sorted { $0.price.value < $1.price.value }
        let tickets = sortedTickets.enumerated().map { ($0 == 0, $1) }

        let date = sortedTickets.first?.departureDateTime ?? Date()
        let departureLongDate = dateFormatterService.longMonthAndDay(from: date)


        return .init(
            cellModels: tickets.map { ticketListCellModel(
                from: $1,
                isFirst: $0,
                origin: model.origin,
                destination: model.destination,
                tapHandler: tapHandler
            )},
            navigationTitle: "Все билеты",
            headerModel: .init(
                title: "\(model.origin.name) — \(model.destination.name)",
                subtitle: "\(departureLongDate), \(model.passengersCount) чел"
            )
        )
    }

    private func ticketListCellModel(
        from ticket: Ticket,
        isFirst: Bool,
        origin: Origin,
        destination: Destination,
        tapHandler: @escaping (Ticket) -> ()
    ) -> TicketListCellModel {

        let ticketPrice = priceFormatter.getFormattedPrice(price: String(ticket.price.value))
        let warningTitle = ticket.availableTicketsCount < 11 ? "Осталось \(ticket.availableTicketsCount) билетов по этой цене" : nil

        let badgeModel = isFirst ? BadgeModel(text: "Самый дешевый") : nil


        return TicketListCellModel(
            id: ticket.id,
            headerModel: .init(
                price: ticketPrice,
                companyName: ticket.airline,
                warningTitle: warningTitle
            ),
            infoModel: ticketDetailsInfoModelFactory.ticketListCellModel(
                ticket: ticket,
                origin: origin,
                destination: destination
            ),
            badgeModel: badgeModel,
            onTap: { tapHandler(ticket) }
        )
    }
}
