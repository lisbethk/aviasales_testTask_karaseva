//
//  BadgeView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct BadgeModel {
    let text: String
}

struct BadgeView: View {
    let model: BadgeModel
    var body: some View {

        Text(model.text)
            .frame(minHeight: 23) // без этого едет спейсинг
            .foregroundColor(Color(UIColor.white))
            .font(.subheadline.weight(.semibold))
            .background(RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(UIColor.systemGreen))
                .frame(height: 23)
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: -8, bottom: 0, trailing: -8)))
    }
}
