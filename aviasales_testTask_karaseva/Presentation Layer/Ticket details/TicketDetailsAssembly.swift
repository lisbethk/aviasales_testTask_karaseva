//
//  TicketDetailsAssembly.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

protocol TicketDetailsAssemblyProtocol {
    func assemble(ticket: Ticket, origin: Origin, destination: Destination, passengersCount: Int) -> UIViewController
}

final class TicketDetailsAssembly: TicketDetailsAssemblyProtocol {

    private let ticketDetailsModelFactory: TicketDetailsModelFactoryProtocol

    init(ticketDetailsModelFactory: TicketDetailsModelFactoryProtocol) {
        self.ticketDetailsModelFactory = ticketDetailsModelFactory
    }

    func assemble(ticket: Ticket, origin: Origin, destination: Destination, passengersCount: Int) -> UIViewController {
        let viewModel = TicketDetailsViewModel(
            ticket: ticket,
            origin: origin,
            destination: destination,
            passengersCount: passengersCount,
            ticketDetailsModelFactory: ticketDetailsModelFactory
        )
        let view = TicketDetailsView(viewModel: viewModel)
        let hostingViewController = UIHostingController(rootView: view)
        return hostingViewController
    }
}
