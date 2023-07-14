//
//  TextStackView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TextStackModel {
    let title: String
    let subtitle: String
    let alignment: HorizontalAlignment
}

struct TextStackView: View {

    let model: TextStackModel

    var body: some View {
        VStack(alignment: model.alignment) {
                Text(model.title)
                    .fontWeight(.semibold)
                Text(model.subtitle)
                    .foregroundColor(
                        Color(UIColor.secondaryLabel)
                    )
                    .font(.subheadline)
            }
    }
}
