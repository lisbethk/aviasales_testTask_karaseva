//
//  MainFlowCoordinator.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import UIKit

final class MainFlowCoordinator {

    private let dispatchQueue = DispatchQueue.global()
    private lazy var requestProcessor = RequestProcessor(
        requestBuilder: RequestBuilder(),
        dataParser: JSONDecoder(),
        dispatchQueue: dispatchQueue,
        httpTransport: URLSession.shared
    )
    private lazy var dateFormatterService = DateFormatterService()
    private lazy var priceFormatter = PriceFormatterService()
    private lazy var ticketDetailsInfoModelFactory = TicketDetailsInfoModelFactory(dateFormatterService: dateFormatterService)
    private lazy var ticketListModelFactory = TicketListModelFactory(
        dateFormatterService: dateFormatterService,
        priceFormatter: priceFormatter,
        ticketDetailsInfoModelFactory: ticketDetailsInfoModelFactory
    )

    private lazy var ticketDetailsModelFactory = TicketDetailsModelFactory(
        ticketDetailsInfoModelFactory: ticketDetailsInfoModelFactory,
        priceFormatter: priceFormatter
    )
    private lazy var searchService = SearchService(requestProcessor: requestProcessor)
    private lazy var allTicketsScreenAssembly = TicketListAssembly(
        searchService: searchService,
        ticketListModelFactory: ticketListModelFactory
    )
    private lazy var ticketDetailsAssembly = TicketDetailsAssembly(ticketDetailsModelFactory: ticketDetailsModelFactory)

    private var rootViewController = UINavigationController()

    @MainActor func start(from window: UIWindow) {
        let rootViewController = allTicketsScreenAssembly.assemble(output: self)
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
