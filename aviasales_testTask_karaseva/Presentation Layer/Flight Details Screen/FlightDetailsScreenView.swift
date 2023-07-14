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


struct PurchaseTicketButtonView: View {
    @State var showAlert = false
    let itemPrice: String

    var body: some View {
        ZStack {
            let orangeColor = UIColor(named: "MyOrange") ?? UIColor.systemOrange
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(
                    Color(orangeColor)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: 50)
                .padding(10)
            Button("Купить билет за \(itemPrice)") {
                showAlert.toggle()
            }
            .foregroundColor(Color(UIColor.white)
            )
            .font(
                .headline
                    .weight(.semibold)
            )
            .alert(isPresented: $showAlert) {
                Alert(title:
                        Text("Билет куплен за \(itemPrice)"),
                      message: nil,
                      dismissButton: .cancel(
                        Text("Отлично")
                      )
                )
            }
        }
    }
}

struct TicketInformationView: View {
    var item: SelectedTicket
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(
                    Color(UIColor.secondarySystemGroupedBackground)
                )
                .frame(maxWidth: .infinity,
                       minHeight: 160,
                       maxHeight: 170,
                       alignment: .center)
                .padding(.horizontal,
                         20)
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(item.company)
                    Text(item.company)
                        .frame(alignment: .center)
                        .font(.headline
                            .weight(.semibold)
                        )
                }
                .frame(maxWidth: .infinity,
                       alignment: .leading)
                OriginDestinationView(pointName: item.origin,
                                      pointCode: item.originCode,
                                      arrivalTime: item.arrivalTime,
                                      ariivalDate: item.arrivalDate)
                OriginDestinationView(pointName: item.destination,
                                      pointCode: item.destinationCode,
                                      arrivalTime: item.arrivalTime,
                                      ariivalDate: item.arrivalDate)
            }
            .padding(.horizontal, 40)
        }
    }
}

struct OridinDestinationAndTicketInfoView: View {
    var item: SelectedTicket
    var body: some View {
        VStack() {
            
            Text("\(item.origin) — \(item.destination)")
                .padding(.horizontal,
                         25)
                .padding(.top,
                         20)
                .font(
                    .title3
                        .weight(.heavy)
                )
                .frame(maxWidth: .infinity,
                       alignment: .leading)
            
            TicketInformationView(item: item)
            
        }
    }
}

struct PriceView: View {
    let numberOfPassengers: String
    let itemPrice: String
    var body: some View {
        VStack {
            Text(itemPrice)
                .font(
                    .largeTitle
                        .weight(.heavy)
                )
            Text("Лучшая цена за \(numberOfPassengers)")
                .font(.caption)
        }
    }
}
