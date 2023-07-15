//
//  TicketDetailsHeaderView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketDetailsHeaderModel {
    let title: String
    let subtitle: String
}

struct TicketDetailsHeaderView: View {

    let model: TicketDetailsHeaderModel
    var body: some View {
        VStack {
            Text(model.title)
                .font(
                    .largeTitle
                        .weight(.heavy)
                )
            Text(model.subtitle)
                .font(.caption)
        }
    }
}
