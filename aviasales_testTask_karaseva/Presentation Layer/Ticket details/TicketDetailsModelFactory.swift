//
//  TicketDetailsModelFactory.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import Foundation

protocol TicketDetailsModelFactoryProtocol {
    func ticketDetailsModel(
        ticket: Ticket,
        origin: Origin,
        destination: Destination,
        personCount: Int,
        showAlert: Bool,
        didTapButton: @escaping () -> (),
        didHideAlert: @escaping () -> ()
    ) -> TicketDetailsModel
}

// передавать валюту в прайсформаттер

final class TicketDetailsModelFactory: TicketDetailsModelFactoryProtocol {

    private let ticketDetailsInfoModelFactory: TicketDetailsInfoModelFactoryProtocol
    private let priceFormatter: PriceFormatterServiceProtocol

    init(ticketDetailsInfoModelFactory: TicketDetailsInfoModelFactoryProtocol,
         priceFormatter: PriceFormatterServiceProtocol) {
        self.ticketDetailsInfoModelFactory = ticketDetailsInfoModelFactory
        self.priceFormatter = priceFormatter
    }

    func ticketDetailsModel(
        ticket: Ticket,
        origin: Origin,
        destination: Destination,
        personCount: Int,
        showAlert: Bool,
        didTapButton: @escaping () -> (),
        didHideAlert: @escaping () -> ()
    ) -> TicketDetailsModel {
        let price = priceFormatter.getFormattedPrice(price: String(ticket.price.value))

        return TicketDetailsModel(
            buttonModel: .init(
                purchaseButtonTitle: "Купить билет за \(price)",
                alerMessage: "Билет куплен за \(price)",
                alertButtonTitle: "Отлично",
                showAlert: showAlert,
                didTapButton: didTapButton,
                didHideAlert: didHideAlert
            ),
            headerModel: .init(
                title: "\(price)",
                subtitle: "Лучшая цена за \(personCount) чел"
            ),
            informationModel: .init(
                companyName: ticket.airline,
                ticketDetailsModel: ticketDetailsInfoModelFactory.ticketListCellModel(
                    ticket: ticket,
                    origin: origin,
                    destination: destination
                )
            ),
            title: "\(origin.name) — \(destination.name)"
        )
    }
}
