//
//  FlightDetailsScreenViewModel.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

@MainActor final class FlightDetailsScreenViewModel: ObservableObject {

    @Published var model: SelectedTicket

    init(model: SelectedTicket) {
        self.model = model
    }

}
