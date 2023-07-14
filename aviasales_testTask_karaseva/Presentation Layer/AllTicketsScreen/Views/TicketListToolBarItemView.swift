//
//  TicketListToolBarItemView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketListToolBarItemView: View {
    let origin: String
    let destination: String
    let longDepartureDate: String
    let passengersCount: String
    var body: some View {
        VStack {
            Text("\(origin) — \(destination)")
                .font(
                    .headline
                    .weight(.semibold)
                )
            Text("\(longDepartureDate), \(passengersCount)")
                .font(.caption)
                .foregroundColor(
                    Color(UIColor.secondaryLabel)
                )
        }
        .offset(y: 10)
        .fixedSize()
    }
}
