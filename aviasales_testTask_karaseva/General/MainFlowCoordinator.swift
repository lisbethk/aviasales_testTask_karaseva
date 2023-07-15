//
//  MainFlowCoordinator.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import UIKit

protocol MainFlowCoordinatorProtocol {
    func start(from window: UIWindow)
}

final class MainFlowCoordinator: MainFlowCoordinatorProtocol {

    private let ticketListAssembly: TicketListAssemblyProtocol
    private let ticketDetailsAssembly: TicketDetailsAssemblyProtocol
    private var rootViewController = UINavigationController()

    init(ticketListAssembly: TicketListAssemblyProtocol, ticketDetailsAssembly: TicketDetailsAssemblyProtocol, rootViewController: UINavigationController = UINavigationController()) {
        self.ticketListAssembly = ticketListAssembly
        self.ticketDetailsAssembly = ticketDetailsAssembly
        self.rootViewController = rootViewController
    }

    func start(from window: UIWindow) {
        let rootViewController = ticketListAssembly.assemble(output: self)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.rootViewController = rootViewController
    }
}

extension MainFlowCoordinator: TicketListViewModelOutputProtocol {
    func showDetails(
        ticket: Ticket,
        origin: Origin,
        destination: Destination,
        passengersCount: Int
    ) {

        let viewController = ticketDetailsAssembly.assemble(
            ticket: ticket,
            origin: origin,
            destination: destination,
            passengersCount: passengersCount
        )
        rootViewController.pushViewController(viewController,
                                              animated: true)
    }
}
