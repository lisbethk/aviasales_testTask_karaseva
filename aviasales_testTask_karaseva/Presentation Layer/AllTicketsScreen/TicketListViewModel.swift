//
//  TicketListViewModel.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol TicketListViewModelOutputProtocol {
    func showDetails(
        ticket: Ticket,
        origin: Origin,
        destination: Destination,
        passengersCount: Int
    )
}

final class TicketListViewModel: ObservableObject {

    enum State {
        case idle
        case loading
        case failed(String)
        case loaded(TicketListScrollModel)
    }
    
    @Published private(set) var state = State.idle

    private let output: TicketListViewModelOutputProtocol
    private let searchService: SearchServiceProtocol
    private let ticketListModelFactory: TicketListModelFactoryProtocol

    init(output: TicketListViewModelOutputProtocol,
         searchService: SearchServiceProtocol,
         ticketListModelFactory: TicketListModelFactoryProtocol
    ) {
        self.output = output
        self.searchService = searchService
        self.ticketListModelFactory = ticketListModelFactory
        loadTickets()
    }

    // view did load

    func loadTickets() {
        state = .loading
        searchService.findTickets(origin: "MOW", destination: "LED") { [weak self] result in
            switch result {
            case .success(let info):
                self?.handleSuccessLoading(info: info)

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.state = .failed(error.localizedDescription)
                }
            }
        }
    }

    // private

    func sortTickets(tickets: [Ticket]) -> [Ticket] {
        let sortedTickets = tickets.sorted {
            $0.price.value < $1.price.value
        }
        return sortedTickets
    }

    // private

    func handleSuccessLoading(info: SearchRequest.Model) {
        let model = ticketListModelFactory.makeTicketListViewModel(model: info) { [weak self] ticket in
            self?.output.showDetails(
                ticket: ticket,
                origin: info.origin,
                destination: info.destination,
                passengersCount: info.passengersCount
            )
        }

        DispatchQueue.main.async {
            self.state = State.loaded(model)
        }
    }
}
