//
//  TicketDetailsInfoView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

struct TicketDetailsModel {
    let buttonModel: TicketDetailsButtonModel
    let headerModel: TicketDetailsHeaderModel
    let informationModel: TicketInformationModel
    let title: String
}

struct TicketDetailsView: View {

    @ObservedObject var viewModel: TicketDetailsViewModel

    var body: some View {
        return ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()

            if let model = viewModel.model {
                VStack {
                    TicketDetailsHeaderView(model: model.headerModel)
                        .frame(alignment: .top)
                        .padding(.vertical, 10)
                    VStack() {
                        Text(model.title)
                            .padding(.horizontal, 25)
                            .padding(.top, 20)
                            .font(.title3.weight(.heavy))
                            .frame(maxWidth: .infinity,
                                   alignment: .leading)
                        TicketInformationView(model: model.informationModel)
                    }
                    Spacer()
                    TicketDetailsButtonView(model: model.buttonModel)
                        .padding(.bottom, 10)
                }
            }
        }
    }
}
