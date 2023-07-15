//
//  TicketDetailsInfoModelFactoryMock.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 15.07.2023.
//


import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

class TicketDetailsInfoModelFactoryMock: TicketDetailsInfoModelFactoryProtocol {

    var invokedTicketListCellModel = false
    var invokedTicketListCellModelCount = 0
    var invokedTicketListCellModelParameters: (ticket: Ticket, origin: Origin, destination: Destination)?
    var invokedTicketListCellModelParametersList = [(ticket: Ticket, origin: Origin, destination: Destination)]()
    var stubbedTicketListCellModelResult: TicketDetailsInfoModel!

    func ticketListCellModel(ticket: Ticket, origin: Origin, destination: Destination) -> TicketDetailsInfoModel {
        invokedTicketListCellModel = true
        invokedTicketListCellModelCount += 1
        invokedTicketListCellModelParameters = (ticket, origin, destination)
        invokedTicketListCellModelParametersList.append((ticket, origin, destination))
        return stubbedTicketListCellModelResult
    }
}
