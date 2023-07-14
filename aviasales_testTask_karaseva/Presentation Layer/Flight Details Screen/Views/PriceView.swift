//
//  PriceView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct PriceView: View {
    let numberOfPassengers: String
    let itemPrice: String
    var body: some View {
        VStack {
            Text(itemPrice)
                .font(
                    .largeTitle
                    .weight(.heavy)
                )
            Text("Лучшая цена за \(numberOfPassengers)")
                .font(.caption)
        }
    }
}
