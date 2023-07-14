//
//  TicketListAssembly.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

protocol TicketListAssemblyProtocol {
    func assemble(output: TicketListViewModelOutputProtocol) -> UINavigationController
}

final class TicketListAssembly: TicketListAssemblyProtocol {

    private let searchService: SearchServiceProtocol
    private let ticketListModelFactory: TicketListModelFactoryProtocol

    init(searchService: SearchServiceProtocol,
         ticketListModelFactory: TicketListModelFactoryProtocol) {
        self.searchService = searchService
        self.ticketListModelFactory = ticketListModelFactory
    }

    func assemble(output: TicketListViewModelOutputProtocol) -> UINavigationController {
        let viewModel = TicketListViewModel(output: output,
                                            searchService: searchService,
                                            ticketListModelFactory: ticketListModelFactory
                                                )
        let view = TicketListView(viewModel: viewModel)
        let hostingViewController = UIHostingController(rootView: view)
        let navigationController = UINavigationController(rootViewController: hostingViewController)
        return navigationController
    }
}
