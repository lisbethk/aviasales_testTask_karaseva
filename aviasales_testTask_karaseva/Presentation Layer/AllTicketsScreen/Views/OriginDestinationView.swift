//
//  OriginDestinationView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct OriginDestinationView: View {
    let pointName: String
    let pointCode: String
    let arrivalTime: String
    let ariivalDate: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(pointName)
                    .fontWeight(.semibold)
                Text(pointCode)
                    .foregroundColor(
                        Color(UIColor.secondaryLabel)
                    )
                    .font(.subheadline)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(arrivalTime)
                    .fontWeight(.semibold)
                Text(ariivalDate)
                    .foregroundColor(
                        Color(UIColor.secondaryLabel)
                    )
                    .font(.subheadline)
            }
        }
    }
}
