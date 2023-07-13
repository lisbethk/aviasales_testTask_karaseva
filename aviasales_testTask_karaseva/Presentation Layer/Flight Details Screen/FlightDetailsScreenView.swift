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
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)

            VStack {
                VStack {
                    Text("17 830 P")
                        .font(
                            .largeTitle
                                .weight(.heavy)
                        )
                    Text("Лучшая цена за 1 чел")
                        .font(.caption)
                }

                VStack() {

                    Text("Москва - Санкт-питербург")
                        .padding(20)
                        .font(
                            .title3
                                .weight(.bold)
                        )
                        .frame(maxWidth: .infinity, alignment: .leading)

                    TicketInformationView(viewModel: viewModel, item: item)

                }
                PurchaseTicketButtonView()
                    .frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
        
    }

}

struct SelectedDestinationPointView: View {
    var viewModel: FlightDetailsScreenViewModel
    var item: SelectedTicket
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.destination)
                    .fontWeight(.semibold)
                Text(item.destinationCode)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(item.arrivalTime)
                    .fontWeight(.semibold)
                Text(item.arrivalDate)
                    .foregroundColor(.gray)
                    .font(.subheadline)

            }
        }

    }
}

struct SelectedOriginPointView: View {
    var viewModel: FlightDetailsScreenViewModel
    var item: SelectedTicket
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.origin)
                    .fontWeight(.semibold)
                Text(item.originCode)
                    .foregroundColor(.gray)
                    .font(.subheadline)

            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(item.departureTime)
                    .fontWeight(.semibold)
                Text(item.departureDate)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
        }
    }
}


struct PurchaseTicketButtonView: View {
    @State var showAlert = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.orange)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(10)
            Button("Купить билет за 17 830 P") {
                showAlert.toggle()
            }
            .foregroundColor(.white)
            .font(
                .headline
                    .weight(.semibold))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Билет куплен за 17 830 P"),
                      message: nil,
                      dismissButton: .cancel(Text("Отлично")))
            }
        }
    }
}

struct TicketInformationView: View {
    var viewModel: FlightDetailsScreenViewModel
    var item: SelectedTicket
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .frame(width: 359, height: 170)
            VStack(spacing: 10) {
                HStack {
                    Image("aeroflot")
                    Text("Фэрофлот")
                    Spacer()
                }
                SelectedDestinationPointView(viewModel: viewModel, item: item)
                SelectedOriginPointView(viewModel: viewModel, item: item)
            }
            .padding(30)
        }
    }
}
