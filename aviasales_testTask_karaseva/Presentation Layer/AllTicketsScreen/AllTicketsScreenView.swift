//
//  AllTicketsScreenView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

struct AllTicketsScreenView: View {

    @ObservedObject var viewModel: AllTicketsScreenViewModel

    var body: some View {

        let items = viewModel.model.model

        if items.isEmpty {
            LoaderView(tintColor: Color(UIColor.systemGray),
                       scaleSize: 2.0).padding(.bottom,
                                               50)
        } else {
            MainView(viewModel: viewModel,
                     items: items)
        }
    }
}
