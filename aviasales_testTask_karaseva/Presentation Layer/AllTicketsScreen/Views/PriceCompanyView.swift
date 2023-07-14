//
//  PriceCompanyView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct PriceCompanyView: View {
    var viewModel: AllTicketsScreenViewModel
    let numberOfTickets: Int
    let price: String
    let companyName: String
    var body: some View {

        VStack(alignment: .leading) {
            HStack {
                Text(price)
                    .font(.title2
                    .weight(.semibold)
                    )
                    .foregroundColor(
                        Color(UIColor.systemBlue)
                    )
                Spacer()
                Image(companyName)
                    .frame(width: 26,
                           height: 26)
            }
            if numberOfTickets < 11 {
                Text("Осталось \(numberOfTickets) билетов по этой цене")
                    .font(.subheadline)
                    .foregroundColor(
                        Color(UIColor.systemRed)
                    )
            }
        }
    }
}
