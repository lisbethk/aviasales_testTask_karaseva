//
//  TicketInformationView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

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
                        .font(
                            .headline
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
