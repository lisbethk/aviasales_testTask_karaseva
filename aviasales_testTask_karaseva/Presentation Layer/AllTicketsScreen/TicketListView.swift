//
//  TicketListView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

struct TicketListView: View {

    @ObservedObject var viewModel: TicketListViewModel

    var body: some View {

        switch viewModel.state {
        case .idle:
            Color.clear.onAppear(perform: viewModel.loadTickets)
        case .loading:
            ProgressView()
        case .failed(let error):
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                VStack(spacing: 5) {
                    Text("Что-то пошло не так")
                        .font(
                            .headline
                            .weight(.bold)
                        )
                    Text(error)
                        .font(.caption)
                        .foregroundColor(
                            Color(UIColor.systemGray)
                        )
                        .multilineTextAlignment(.center)
                }

                Button("Повторить") {
                    viewModel.loadTickets()
                }
                Spacer()
            }
            .padding(40)

        case let .loaded(model):
            TicketListScrollView(model: model)
        }
    }
}
