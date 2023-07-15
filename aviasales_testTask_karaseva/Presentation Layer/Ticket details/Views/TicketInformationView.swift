//
//  TicketInformationView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketInformationModel {
    let companyName: String
    let ticketDetailsModel: TicketDetailsInfoModel
}

struct TicketInformationView: View {
    let model: TicketInformationModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(
                    Color(UIColor.secondarySystemGroupedBackground)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: 160,
                       alignment: .center)
                .padding(.horizontal,
                         20)
            VStack(spacing: 15) {
                HStack(spacing: 10) {
                    Image(model.companyName)
                    Text(model.companyName)
                        .frame(alignment: .center)
                        .font(
                            .headline
                                .weight(.semibold)
                        )
                }
                .frame(maxWidth: .infinity,
                       alignment: .leading)

                TicketDetailsInfoView(model: model.ticketDetailsModel)
            }
            .padding(.horizontal, 40)
            .frame(height: 160)
        }
    }
}
