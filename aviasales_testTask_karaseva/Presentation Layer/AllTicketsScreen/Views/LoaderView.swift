//
//  LoaderView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct LoaderView: View {
    var tintColor: Color = .blue
    var scaleSize: CGFloat = 1.0

    var body: some View {
        ProgressView()
            .scaleEffect(scaleSize,
                         anchor: .center)
            .progressViewStyle(
                CircularProgressViewStyle(tint: tintColor)
            )
    }
}
