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

@MainActor final class AllTicketsScreenViewModel: ObservableObject {

    @Published var model = AllTicketsScreenModel(model: [])

    private let output: AllTicketsScreenViewModelOutputProtocol
    private let searchService: SearchServiceProtocol
    private let dateFormatterService: DateFormatterServiceProtocol
    private let priceFormatterService: PriceFormatterServiceProtocol

    init(output: AllTicketsScreenViewModelOutputProtocol,
         searchService: SearchServiceProtocol,
         dateFormatterService: DateFormatterServiceProtocol,
         priceFormatterService: PriceFormatterServiceProtocol
    ) {
        self.output = output
        self.searchService = searchService
        self.dateFormatterService = dateFormatterService
        self.priceFormatterService = priceFormatterService
        loadTickets()
    }

    func loadTickets() {
        var items = [AllTicketsScreenModel.Item]()
        searchService.findTickets(origin: "MOW", destination: "LED") { [weak self] result in
            switch result {
            case .success(let info):
                let tickets = info.results
                tickets.forEach { results in

                    guard let departureDate = self?.dateFormatterService.getFormattedDate(date: results.departureDateTime),
                    let departureTime = self?.dateFormatterService.getFormattedTime(date: results.departureDateTime),
                    let arrivalDate = self?.dateFormatterService.getFormattedDate(date: results.arrivalDateTime),
                    let arrivalTime = self?.dateFormatterService.getFormattedTime(date: results.arrivalDateTime) else { return }

                    let price = self?.priceFormatterService.getFormattedPrice(price: String(results.price.value), currency: results.price.currency)

                    let item = AllTicketsScreenModel.Item(id: results.id, price: price ?? "No data", company: results.airline, numberOfTickets: results.availableTicketsCound, origin: info.origin.name, originCode: info.origin.iata, destination: info.destination.name, destinationCode: info.destination.iata, departureDate: departureDate, departureTime: departureTime, arrivalDate: arrivalDate, arrivalTime: arrivalTime)

                    items.append(item)
                }
                DispatchQueue.main.async {
                    self?.model = AllTicketsScreenModel(model: items)
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
