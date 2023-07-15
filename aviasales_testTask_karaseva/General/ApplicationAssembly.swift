//
//  ApplicationAssembly.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import Foundation

protocol ApplicationAssemblyProtocol {
    func assembleMainFlowCoordinator() -> MainFlowCoordinatorProtocol
}

final class ApplicationAssembly: ApplicationAssemblyProtocol {
    
    private let dispatchQueue = DispatchQueue.global()
    private lazy var requestProcessor = RequestProcessor(
        requestBuilder: RequestBuilder(),
        dataParser: JSONDecoder(),
        dispatchQueue: dispatchQueue,
        httpTransport: URLSession.shared
    )
    private lazy var dateFormatterService = DateFormatterService(dateFormatter: DateFormatter())
    private lazy var priceFormatter = PriceFormatterService()
    private lazy var ticketDetailsInfoModelFactory = TicketDetailsInfoModelFactory(
        dateFormatterService: dateFormatterService)
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


    private lazy var ticketListAssembly = TicketListAssembly(
        searchService: searchService,
        ticketListModelFactory: ticketListModelFactory
    )
    private lazy var ticketDetailsAssembly = TicketDetailsAssembly(ticketDetailsModelFactory: ticketDetailsModelFactory)

    func assembleMainFlowCoordinator() -> MainFlowCoordinatorProtocol {
        let mainFlowCoordinator = MainFlowCoordinator(
            ticketListAssembly: ticketListAssembly,
            ticketDetailsAssembly: ticketDetailsAssembly
        )
        return mainFlowCoordinator
    }
}

