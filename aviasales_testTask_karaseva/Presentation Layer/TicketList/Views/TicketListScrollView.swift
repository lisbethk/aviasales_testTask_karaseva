//
//  TicketListScrollView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketListScrollModel {
    let cellModels: [TicketListCellModel]
    let navigationTitle: String
    let headerModel: TicketListHeaderModel
}

struct TicketListScrollView: View {

    let model: TicketListScrollModel

    var body: some View {

        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()

            ScrollView {
                LazyVStack {
                    ForEach(model.cellModels, id: \.id) { item in
                        Section {
                            TicketListCellView(model: item)
                        }
                    }
                }
                .offset(y: 10)
                .navigationTitle(model.navigationTitle)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    TicketListHeaderView(model: model.headerModel)
                }
            }
        }
    }
}
