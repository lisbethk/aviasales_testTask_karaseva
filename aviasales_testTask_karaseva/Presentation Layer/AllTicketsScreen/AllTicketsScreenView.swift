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

        ZStack {
            Color(UIColor.secondarySystemBackground)
                .ignoresSafeArea()
                .navigationTitle("Все билеты")

            let firstItem = viewModel.model.model.first
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.model.model, id: \.id) { item in
                    ZStack {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .foregroundColor(.white)
                            if item.id == firstItem?.id {
                                Badge()
                                    .offset(x: 10, y: -10)
                            }
                        }

                        LazyVStack(spacing: 15) {
                            PriceCompanyView(viewModel: viewModel, item: item)
                            OriginPointView(viewModel: viewModel, item: item)
                            DestinationPointView(viewModel: viewModel, item: item)
                        }
                        .padding(20)
                        .onTapGesture {
                            viewModel.showDetails(of: item)
                        }
                        .toolbar {
                            ToolbarItem(placement: .principal) {
                                VStack {
                                    Text("\(item.origin) — \(item.destination)")
                                        .font(.headline
                                            .weight(.semibold))
                                    Text("\(item.departureDate)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .padding(5)
                }
                .padding(10)
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
                    .foregroundColor(.blue)
                Spacer()
                Image(item.company)
                    .frame(width: 26, height: 26)
            }
            if item.numberOfTickets < 11 {
                Text("Осталось \(item.numberOfTickets) билетов по этой цене")
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
        }
    }
}

struct DestinationPointView: View {
    var viewModel: AllTicketsScreenViewModel
    var item: AllTicketsScreenModel.Item
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

struct OriginPointView: View {
    var viewModel: AllTicketsScreenViewModel
    var item: AllTicketsScreenModel.Item
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

struct Badge: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.green)
                .frame(width: 145, height: 23)
                .cornerRadius(10)
            Text("Самый дешевый")
                .foregroundColor(.white)
                .font(.subheadline
                    .weight(.semibold))
        }
    }
}
