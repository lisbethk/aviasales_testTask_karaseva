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
                .navigationBarTitle("", displayMode: .inline)

            VStack {
                PriceView(viewModel: viewModel, item: item)
                    .frame(alignment: .top)
                OridinDestinationAndTicketInfoView(viewModel: viewModel, item: item)
                    .frame(alignment: .top)
                Spacer()

                PurchaseTicketButtonView(item: item)
                    .frame(alignment: .bottom)
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
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(item.arrivalTime)
                    .fontWeight(.semibold)
                Text(item.arrivalDate)
                    .foregroundColor(Color(UIColor.secondaryLabel))
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
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.subheadline)

            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(item.departureTime)
                    .fontWeight(.semibold)
                Text(item.departureDate)
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.subheadline)
            }
        }
    }
}


struct PurchaseTicketButtonView: View {
    @State var showAlert = false
    var item: SelectedTicket

    var body: some View {
        ZStack {
            let orangeColor = UIColor(named: "MyOrange") ?? UIColor.systemOrange
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(orangeColor))
                .frame(maxWidth: .infinity, maxHeight: 50)
                .padding(10)
            Button("Купить билет за \(item.price)") {
                showAlert.toggle()
            }
            .foregroundColor(Color(UIColor.white))
            .font(
                .headline
                    .weight(.semibold))
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Билет куплен за \(item.price)"),
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
                .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                .frame(maxWidth: .infinity, minHeight: 160, maxHeight: 170, alignment: .center)
                .padding(.horizontal, 20)
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(item.company)
                    Text(item.company)
                        .frame(alignment: .center)
                        .font(.headline
                            .weight(.semibold))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                SelectedOriginPointView(viewModel: viewModel, item: item)
                SelectedDestinationPointView(viewModel: viewModel, item: item)
            }
            .padding(.horizontal, 40)
        }
    }
}

struct OridinDestinationAndTicketInfoView: View {
    var viewModel: FlightDetailsScreenViewModel
    var item: SelectedTicket
    var body: some View {
        VStack() {
            
            Text("\(item.origin) — \(item.destination)")
                .padding(.horizontal, 25)
                .padding(.top, 20)
                .font(
                    .title3
                        .weight(.heavy)
                )
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TicketInformationView(viewModel: viewModel, item: item)
            
        }
    }
}

struct PriceView: View {
    var viewModel: FlightDetailsScreenViewModel
    var item: SelectedTicket
    var body: some View {
        VStack {
            Text(item.price)
                .font(
                    .largeTitle
                        .weight(.heavy)
                )
            Text("Лучшая цена за \(item.numberOfPassengers)")
                .font(.caption)
        }
    }
}
