//
//  BadgeView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct BadgeView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(
                    Color(UIColor.systemGreen)
                )
                .frame(width: 145, height: 23)
                .cornerRadius(10)
            Text("Самый дешевый")
                .foregroundColor(
                    Color(UIColor.white)
                )
                .font(
                    .subheadline
                    .weight(.semibold)
                )
        }
    }
}
