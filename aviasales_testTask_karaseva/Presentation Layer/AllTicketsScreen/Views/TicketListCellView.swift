//
//  ListCellView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketListCellModel {
    let id: String
    let headerModel: TicketListCellHeaderModel
    let infoModel: TicketDetailsInfoModel
    let badgeModel: BadgeModel?
    let onTap: () -> ()
}

struct TicketListCellView: View {

    let model: TicketListCellModel

    var body: some View {

        ZStack {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: .infinity,
                           alignment: .center)
                    .foregroundColor(
                        Color(UIColor.secondarySystemGroupedBackground)
                    )

                // если модель приходит то рисовать
                if let badgeModel = model.badgeModel {
                    BadgeView(model: badgeModel)
                        .offset(x: 10,
                                y: -10)
                }
            }
            LazyVStack(spacing: 15) {
                TicketListCellHeaderView(model: model.headerModel)
                TicketDetailsInfoView(model: model.infoModel)
            }
            .padding(20)
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .onTapGesture {
            model.onTap()
        }
    }
}
