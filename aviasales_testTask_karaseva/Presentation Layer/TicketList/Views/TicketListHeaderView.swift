//
//  TicketListHeaderView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketListHeaderModel {
    let title: String
    let subtitle: String
}

struct TicketListHeaderView: View {
    
    let model: TicketListHeaderModel
    
    var body: some View {
        VStack {
            Text(model.title)
                .font(
                    .headline
                        .weight(.semibold)
                )
            Text(model.subtitle)
                .font(.caption)
                .foregroundColor(
                    Color(UIColor.secondaryLabel)
                )
        }
    }
}
