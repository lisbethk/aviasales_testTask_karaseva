//
//  PurchaseTicketBottomView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct PurchaseTicketButtonView: View {
    @State var showAlert = false
    let itemPrice: String

    var body: some View {
        ZStack {
            let orangeColor = UIColor(named: "MyOrange") ?? UIColor.systemOrange
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(
                    Color(orangeColor)
                )
                .frame(maxWidth: .infinity,
                       maxHeight: 50)
                .padding(10)
            Button("Купить билет за \(itemPrice)") {
                showAlert.toggle()
            }
            .foregroundColor(Color(UIColor.white)
            )
            .font(
                .headline
                .weight(.semibold)
            )
            .alert(isPresented: $showAlert) {
                Alert(title:
                        Text("Билет куплен за \(itemPrice)"),
                      message: nil,
                      dismissButton: .cancel(
                        Text("Отлично")
                      )
                )
            }
        }
    }
}
