//
//  TicketDetailsInfoView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketDetailsInfoModel {
    let topLeftStackModel: TextStackModel
    let topRightStackModel: TextStackModel
    let bottomLeftStackModel: TextStackModel
    let bottomRightStackModel: TextStackModel
}

struct TicketDetailsInfoView: View {
    let model: TicketDetailsInfoModel
    var body: some View {
        VStack(spacing: 10) {
            makeStack(topViewModel: model.topLeftStackModel, bottomViewModel: model.topRightStackModel)
            makeStack(topViewModel: model.bottomLeftStackModel, bottomViewModel: model.bottomRightStackModel)
        }
    }
    
    private func makeStack(topViewModel: TextStackModel, bottomViewModel: TextStackModel) -> some View {
        HStack {
            TextStackView(model: topViewModel)
            Spacer()
            TextStackView(model: bottomViewModel)
        }
    }
}
