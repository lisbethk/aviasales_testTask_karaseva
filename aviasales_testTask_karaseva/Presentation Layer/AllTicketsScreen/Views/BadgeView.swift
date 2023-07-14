//
//  BadgeView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

// на вход чтоб строчку получало

struct BadgeModel {
    let text: String
}

struct BadgeView: View {
    let model: BadgeModel
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(
                    Color(UIColor.systemGreen)
                )
                .frame(width: 145, height: 23)
                .cornerRadius(10)
            Text(model.text)
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
