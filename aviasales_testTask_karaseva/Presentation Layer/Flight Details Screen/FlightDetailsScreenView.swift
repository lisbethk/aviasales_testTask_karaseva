//
//  FlightDetailsScreenView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation
import SwiftUI

struct FlightDetailsScreenView: View {

    @ObservedObject var viewModel: FlightDetailsScreenViewModel

    var item: SelectedTicket

    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
                .navigationBarTitle("",
                                    displayMode: .inline)

            VStack {
                PriceView(numberOfPassengers: item.numberOfPassengers,
                          itemPrice: item.price
                )
                    .frame(alignment: .top)
                OridinDestinationAndTicketInfoView(item: item)
                    .frame(alignment: .top)
                
                Spacer()

                PurchaseTicketButtonView(itemPrice: item.price)
                    .frame(alignment: .bottom)
            }
        }
    }
}
