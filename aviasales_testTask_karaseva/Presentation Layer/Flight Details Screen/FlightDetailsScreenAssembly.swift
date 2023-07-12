//
//  FlightDetailsScreenAssembly.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

protocol FlightDetailsScreenAssemblyProtocol {
    @MainActor func assemble(input: SelectedTicket) -> UIViewController
}

final class FlightDetailsScreenAssembly: FlightDetailsScreenAssemblyProtocol {

    @MainActor func assemble(input: SelectedTicket) -> UIViewController {
        let viewModel = FlightDetailsScreenViewModel(model: input)
        let view = FlightDetailsScreenView(viewModel: viewModel, item: input)
        let hostingViewController = UIHostingController(rootView: view)
//        let navigationController = UINavigationController(rootViewController: hostingViewController)
//        hostingViewController.navigationItem.largeTitleDisplayMode = .never
        return hostingViewController
    }
}
