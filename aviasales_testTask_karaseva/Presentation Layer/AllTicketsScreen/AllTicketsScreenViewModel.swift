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
        searchService.findTickets(origin: "MOW", destination: "LED") { [weak self] result in
            switch result {
            case .success(let info):
                self?.handleSuccessLoading(info: info)

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func sortTickets(tickets: [AllTicketsScreenModel.Item]) -> [AllTicketsScreenModel.Item] {
        let sortedTickets = tickets.sorted {
            $0.price < $1.price
        }
        return sortedTickets
    }

    func showDetails(of item: AllTicketsScreenModel.Item) {
        output.showSelectedTicket(item: item)
    }

    func handleSuccessLoading(info: SearchRequest.Model) {
        var items = [AllTicketsScreenModel.Item]()

        let tickets = info.results
        tickets.forEach { results in

            let item = makeItem(results: results,
                                info: info)
            items.append(item)
        }

        let sortedTickets = sortTickets(tickets: items)

        DispatchQueue.main.async {
            self.model = AllTicketsScreenModel(model: sortedTickets)
        }
    }

    func makeItem(results: Results, info: SearchRequest.Model) -> AllTicketsScreenModel.Item {
        let departureDate = dateFormatterService.monthAndDay(from: results.departureDateTime)
        let departureTime = dateFormatterService.hoursAndMinutes(from: results.departureDateTime)
        let arrivalDate = dateFormatterService.monthAndDay(from: results.arrivalDateTime)
        let arrivalTime = dateFormatterService.hoursAndMinutes(from: results.arrivalDateTime)
        let longDepartureDate = dateFormatterService.longMonthAndDay(from: results.departureDateTime)
        let departureWeekDay = dateFormatterService.weekDay(from: results.departureDateTime)
        let arrivalWeekDay = dateFormatterService.weekDay(from: results.arrivalDateTime)

        let price = self.priceFormatterService.getFormattedPrice(price: String(results.price.value))

        let item = AllTicketsScreenModel.Item(id: results.id,
                                              price: price,
                                              company: results.airline,
                                              numberOfTickets: results.availableTicketsCound,
                                              origin: info.origin.name,
                                              originCode: info.origin.iata,
                                              destination: info.destination.name,
                                              destinationCode: info.destination.iata,
                                              departureDate: departureDate + "," + " " + departureWeekDay,
                                              departureTime: departureTime,
                                              arrivalDate: arrivalDate + "," + " " + arrivalWeekDay,
                                              arrivalTime: arrivalTime,
                                              passengersCount: String("\(info.passengersCount) чел"),
                                              longDepartureDate: longDepartureDate)
        return item
    }
}
