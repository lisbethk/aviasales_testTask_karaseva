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
    
    private lazy var searchService = SearchService(requestProcessor: requestProcessor)
    private lazy var allTicketsScreenAssembly = AllTicketsScreenAssembly(searchService: searchService)
    private lazy var flightDetailsScreenAssembly = FlightDetailsScreenAssembly()


    private var rootViewController = UINavigationController()

    @MainActor func start(from window: UIWindow) {
        let rootViewController = allTicketsScreenAssembly.assemble(output: self)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.rootViewController = rootViewController
    }
}

extension MainFlowCoordinator: AllTicketsScreenViewModelOutputProtocol {
    @MainActor func showSelectedTicket(item: AllTicketsScreenModel.Item) {

        let ticket = SelectedTicket(id: item.id,
                                    price: item.price,
                                    company: item.company,
                                    origin: item.origin,
                                    originCode: item.originCode,
                                    destination: item.destination,
                                    destinationCode: item.destinationCode,
                                    departureDate: item.departureDate,
                                    departureTime: item.departureTime,
                                    arrivalDate: item.arrivalDate,
                                    arrivalTime: item.arrivalTime,
                                    numberOfPassengers: item.passengersCount)

        let viewController = flightDetailsScreenAssembly.assemble(input: ticket)

        rootViewController.pushViewController(viewController,
                                              animated: true)
    }
}
