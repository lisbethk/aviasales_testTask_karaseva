//
//  PurchaseTicketBottomView.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 14.07.2023.
//

import SwiftUI

struct TicketDetailsButtonModel {
    let purchaseButtonTitle: String
    let alerMessage: String
    let alertButtonTitle: String
    let showAlert: Bool
    let didTapButton: () -> ()
    let didHideAlert: () -> ()
}

struct TicketDetailsButtonView: View {
    let model: TicketDetailsButtonModel

    var body: some View {
        Button {
            model.didTapButton()
        } label: {
            Text(model.purchaseButtonTitle)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(Color.white)
                .font(.headline.weight(.semibold))
                .background(Color(UIColor(named: "MyOrange") ?? UIColor.systemOrange))
                .cornerRadius(10)
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
        .alert(isPresented: .init(
            get: { model.showAlert },
            set: { isShown in guard !isShown else { return }; model.didHideAlert() }
        )) {
            Alert(title: Text(model.alerMessage),
                  message: nil,
                  dismissButton: .cancel(Text(model.alertButtonTitle))
            )
        }
    }
}
