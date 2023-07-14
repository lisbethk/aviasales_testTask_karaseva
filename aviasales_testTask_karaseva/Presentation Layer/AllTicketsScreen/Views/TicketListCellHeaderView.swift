//
//  TicketListCellHeaderView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketListCellHeaderModel {
    let price: String
    let companyName: String
    let warningTitle: String?
}

struct TicketListCellHeaderView: View {
    let model: TicketListCellHeaderModel
    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(model.price)
                    .font(.title2
                    .weight(.semibold)
                    )
                    .foregroundColor(
                        Color(UIColor.systemBlue)
                    )
                    .accessibilityIdentifier("PriceLabel")
                Spacer()
                Image(model.companyName)
                    .frame(width: 26,
                           height: 26)
                    .accessibilityIdentifier("CompanyIcon")
            }
            if let title = model.warningTitle {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(
                        Color(UIColor.systemRed)
                    )
                    .accessibilityIdentifier("NumberOfTicketsLabel")
            }
        }
    }
}
