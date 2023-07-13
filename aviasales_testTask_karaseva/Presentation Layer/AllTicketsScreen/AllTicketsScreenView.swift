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
        var firstItem = viewModel.model.model.first

        List(viewModel.model.model, id: \.id) { item in
            
            ZStack {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 343, height: 182)
                        .foregroundColor(.white)
                    if item.id == firstItem?.id {
                        Badge()
                            .offset(x: 20, y: -10)
                    }
                }

                LazyVStack(spacing: 10) {
                    PriceCompanyView(viewModel: viewModel, item: item)
                    DestinationPointView(viewModel: viewModel, item: item)
                    OriginPointView(viewModel: viewModel, item: item)
                }
                .padding(10)
                .onTapGesture {
                    viewModel.showDetails(of: item)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("\(item.origin) — \(item.destination)")
                            Text("\(item.departureDate)")
                        }
                    }
                }
            }
            .listRowBackground(Color.clear)
            .navigationTitle("Все билеты")
            .listStyle(.plain)
            .
        }
    }
}




struct PriceCompanyView: View {

    var viewModel: AllTicketsScreenViewModel
    var item: AllTicketsScreenModel.Item
    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(item.company)
//                Text(item.price)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.blue)
                Spacer()
                Image(item.company)
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
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.green)
                .frame(width: 150, height: 20)
                .cornerRadius(10)
            Text("Самый дешевый")
                .foregroundColor(.white)
                .font(.caption
                    .weight(.semibold))
        }
    }
}

//extension View {
//    func addVerifiedBadge(_ isVerified: Bool) -> some View {
//        ZStack(alignment: .topLeading) {
//            self
//
//            if isVerified {
//                Image(systemName: "checkmark.circle.fill")
//                    .offset(x: 20, y: -20)
//            }
//        }
//    }
//}

extension View {
    func hideListRowSeperator() -> some View {
        if #available(iOS 15, *) {
            return AnyView(self.listRowSeparator(.hidden))
        } else {
            return AnyView(self.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .listRowInsets(EdgeInsets(top: -1, leading: -1, bottom: -1, trailing: -1))
                .background(Color(.systemBackground)))
        }
    }
}
