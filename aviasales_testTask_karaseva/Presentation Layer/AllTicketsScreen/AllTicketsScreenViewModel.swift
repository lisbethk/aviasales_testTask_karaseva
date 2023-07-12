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
        let items = AllTicketsScreenModel.Item.init(id: UUID(), price: "12345", company: "avisasales", numberOfTickets: 8, origin: "Origin", originCode: "ORG", destination: "Destination", destinationCode: "DST", departureDate: "3 сен", departureTime: "20:52", arrivalDate: "3 сен", arrivalTime: "22:50")
        model = AllTicketsScreenModel(model: [items])
        searchService.findTickets(origin: "MOW", destination: "LED") { result in
            print(result)
        }

    }

    func showDetails(of item: AllTicketsScreenModel.Item) {
        output.showSelectedTicket(item: item)
    }
}
