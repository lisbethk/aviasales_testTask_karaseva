//
//  AllTicketsScreenView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

struct AllTicketsScreenView: View {

    @ObservedObject var viewModel: AllTicketsScreenViewModel

    var body: some View {

        if viewModel.model.model.isEmpty {
            LoaderView(tintColor: .gray, scaleSize: 2.0).padding(.bottom,50)
        } else {
            ZStack {
                Color(UIColor.systemGroupedBackground)
                    .ignoresSafeArea()
                    .navigationTitle("Все билеты")

                let firstItem = viewModel.model.model.first
                List(viewModel.model.model, id: \.id) { item in
                    Section {
                        ZStack {
                            ZStack(alignment: .topLeading) {
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .foregroundColor(Color(UIColor.secondarySystemGroupedBackground))
                                if item.id == firstItem?.id {
                                    Badge()
                                        .offset(x: 10, y: -10)
                                }
                            }

                            LazyVStack(spacing: 15) {
                                PriceCompanyView(viewModel: viewModel, item: item)
                                OriginDestinationView(pointName: item.origin, pointCode: item.originCode, arrivalTime: item.arrivalTime, ariivalDate: item.arrivalDate)
                                OriginDestinationView(pointName: item.destination, pointCode: item.destinationCode, arrivalTime: item.arrivalTime, ariivalDate: item.arrivalDate)
                            }
                            .padding(20)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    VStack {
                                        Text("\(item.origin) — \(item.destination)")
                                            .font(.headline
                                                .weight(.semibold))
                                        Text("\(item.longDepartureDate), \(item.passengersCount)")
                                            .font(.caption)
                                            .foregroundColor(Color(UIColor.secondaryLabel))
                                    }
                                    .offset(y: 10)
                                    .fixedSize()
                                }
                            }
                        }
                        .listRowBackground(Color.clear)
                        .padding(10)
                        .listRowInsets(EdgeInsets(top: -20, leading: -10, bottom: -20, trailing: -10))
                        .onTapGesture {
                            viewModel.showDetails(of: item)
                        }
                    }

                }
                //                .frame(maxWidth: .infinity)
                //                .listRowInsets(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                .offset(y: 10)

                .listStyle(.insetGrouped)
                //                .listStyle(.plain)
                //                .padding(-10)

            }
        }


    }
}

struct PriceCompanyView: View {

    var viewModel: AllTicketsScreenViewModel
    var item: AllTicketsScreenModel.Item
    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(item.price)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color(UIColor.systemBlue))
                Spacer()
                Image(item.company)
                    .frame(width: 26, height: 26)
            }
            if item.numberOfTickets < 11 {
                Text("Осталось \(item.numberOfTickets) билетов по этой цене")
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.systemRed))
            }
        }
    }
}

struct OriginDestinationView: View {
    let pointName: String
    let pointCode: String
    let arrivalTime: String
    let ariivalDate: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pointName)
                    .fontWeight(.semibold)
                Text(pointCode)
                    .foregroundColor(
                        Color(UIColor.secondaryLabel)
                    )
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(arrivalTime)
                    .fontWeight(.semibold)
                Text(ariivalDate)
                    .foregroundColor(
                        Color(UIColor.secondaryLabel)
                    )
                    .font(.subheadline)
            }
        }
    }
}

struct Badge: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(UIColor.systemGreen))
                .frame(width: 145, height: 23)
                .cornerRadius(10)
            Text("Самый дешевый")
                .foregroundColor(Color(UIColor.white))
                .font(.subheadline
                    .weight(.semibold))
        }
    }
}

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0

    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize, anchor: .center)
            .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
    }
}
