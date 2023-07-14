//
//  OridinDestinationAndTicketInfoView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

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
