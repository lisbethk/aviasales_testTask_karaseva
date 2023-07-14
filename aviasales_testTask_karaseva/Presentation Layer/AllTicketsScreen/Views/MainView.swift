//
//  MainView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct MainView: View {
    var viewModel: AllTicketsScreenViewModel
    var items: [AllTicketsScreenModel.Item]

    var body: some View {

        ZStack {
            BackgroundColorView()

            let firstItem = items.first

            List(items, id: \.id) { item in
                Section {
                    ZStack {
                        ZStack(alignment: .topLeading) {
                            RoundedRectangle(cornerRadius: 20)
                                .frame(maxWidth: .infinity,
                                       alignment: .center)
                                .foregroundColor(
                                    Color(UIColor.secondarySystemGroupedBackground)
                                )
                            if item.id == firstItem?.id {
                                BadgeView()
                                    .offset(x: 10,
                                            y: -10)
                            }
                        }

                        ListCellView(viewModel: viewModel,
                                     item: item)
                    }
                    .listRowBackground(Color.clear)
                    .padding(10)
                    .listRowInsets(
                        EdgeInsets(top: -20,
                                   leading: -10,
                                   bottom: -20,
                                   trailing: -10))
                    .onTapGesture {
                        viewModel.showDetails(of: item)
                    }
                }
            }
            //                .frame(maxWidth: .infinity)
            //                .listRowInsets(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            .offset(y: 10)
            .listStyle(.insetGrouped)
            //                .listStyle(.plain)
            //                .padding(-10)

        }
    }
}
