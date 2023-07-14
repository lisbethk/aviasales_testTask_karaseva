//
//  AllTicketsScreenAssembly.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import SwiftUI

protocol AllTicketsScreenAssemblyProtocol {
    func assemble(output: AllTicketsScreenViewModelOutputProtocol) -> UINavigationController
}

final class AllTicketsScreenAssembly: AllTicketsScreenAssemblyProtocol {

    private let searchService: SearchServiceProtocol

    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }

    @MainActor func assemble(output: AllTicketsScreenViewModelOutputProtocol) -> UINavigationController {
        let viewModel = AllTicketsScreenViewModel(output: output,
                                                  searchService: searchService,
                                                  dateFormatterService: DateFormatterService(),
                                                  priceFormatterService: PriceFormatterService()
                                                )
        let view = AllTicketsScreenView(viewModel: viewModel)
        let hostingViewController = UIHostingController(rootView: view)
        let navigationController = UINavigationController(rootViewController: hostingViewController)
        return navigationController
    }
}
