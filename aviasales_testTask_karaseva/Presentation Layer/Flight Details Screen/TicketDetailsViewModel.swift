//
//  TicketDetailsInfoViewModel.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

final class TicketDetailsViewModel: ObservableObject {

    @Published var model: TicketDetailsModel?
    private let ticketDetailsModelFactory: TicketDetailsModelFactoryProtocol
    private let ticket: Ticket
    private let origin: Origin
    private let destination: Destination
    private let passengersCount: Int

    private lazy var showAlert = false {
        didSet {
            model = ticketDetailsModelFactory.ticketDetailsModel(
                ticket: ticket,
                origin: origin,
                destination: destination,
                personCount: passengersCount,
                showAlert: showAlert,
                didTapButton: { [weak self] in self?.showAlert = true },
                didHideAlert: { [weak self] in self?.showAlert = false }
            )
        }
    }

    init(ticket: Ticket,
         origin: Origin,
         destination: Destination,
         passengersCount: Int,
         ticketDetailsModelFactory: TicketDetailsModelFactoryProtocol
    ) {
        self.ticket = ticket
        self.origin = origin
        self.destination = destination
        self.passengersCount = passengersCount
        self.ticketDetailsModelFactory = ticketDetailsModelFactory

        showAlert = false
    }
}
