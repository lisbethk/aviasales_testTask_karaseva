//
//  ListCellView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct ListCellView: View {

    var viewModel: AllTicketsScreenViewModel
    var item: AllTicketsScreenModel.Item

    var body: some View {
        LazyVStack(spacing: 15) {
            PriceCompanyView(viewModel: viewModel,
                             numberOfTickets: item.numberOfTickets,
                             price: item.price,
                             companyName: item.company)
            OriginDestinationView(pointName: item.origin,
                                  pointCode: item.originCode,
                                  arrivalTime: item.arrivalTime,
                                  ariivalDate: item.arrivalDate)
            OriginDestinationView(pointName: item.destination,
                                  pointCode: item.destinationCode,
                                  arrivalTime: item.arrivalTime,
                                  ariivalDate: item.arrivalDate)
        }
        .padding(20)
        .toolbar {
            ToolbarItem(placement: .principal) {
                TicketListToolBarItemView(origin: item.origin,
                                      destination: item.destination,
                                      longDepartureDate: item.longDepartureDate,
                                      passengersCount: item.passengersCount)
            }
        }
    }
}
