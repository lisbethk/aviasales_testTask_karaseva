//
//  AllTicketsScreenViewModel.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol AllTicketsScreenViewModelOutputProtocol {
    func showSelectedTicket(item: AllTicketsScreenModel.Item)
}

protocol AllTicketsScreenViewModelProtocol {

}

@MainActor final class AllTicketsScreenViewModel: ObservableObject {

    @Published var model = AllTicketsScreenModel(model: [])

    private let output: AllTicketsScreenViewModelOutputProtocol
    private let searchService: SearchServiceProtocol

    init(output: AllTicketsScreenViewModelOutputProtocol,
         searchService: SearchServiceProtocol
    ) {
        self.output = output
        self.searchService = searchService
        loadTickets()
    }

    func loadTickets() {
        var items = [AllTicketsScreenModel.Item]()
        searchService.findTickets(origin: "MOW", destination: "LED") { result in
            switch result {
            case .success(let info):
                let tickets = info.results
                tickets.forEach { results in
                    let item = AllTicketsScreenModel.Item(id: results.id, price: results.price.value, company: results.airline, numberOfTickets: results.availableTicketsCound, origin: info.origin.name, originCode: info.origin.iata, destination: info.destination.name, destinationCode: info.destination.iata, departureDate: results.departureDateTime, departureTime: results.departureDateTime, arrivalDate: results.arrivalDateTime, arrivalTime: results.arrivalDateTime)
                    items.append(item)
                }
                DispatchQueue.main.async {
                    self.model = AllTicketsScreenModel(model: items)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func showDetails(of item: AllTicketsScreenModel.Item) {
        output.showSelectedTicket(item: item)
    }
}
