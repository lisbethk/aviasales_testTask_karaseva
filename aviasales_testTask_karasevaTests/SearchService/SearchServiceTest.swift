//
//  SearchServiceTest.swift
//  aviasales_testTask_karasevaTests
//
//  Created by Lisbeth Karasev on 15.07.2023.
//

import XCTest
import UIKit

@testable import aviasales_testTask_karaseva

final class TicketListModelFactoryTest: XCTestCase {

    var ticketListModelFactory: TicketListModelFactory!
    var dateFormatterServiceMock: DateFormatterServiceMock!
    var priceFormatterMock: PriceFormatterServiceMock!
    var ticketDetailsInfoModelFactoryMock: TicketDetailsInfoModelFactoryMock!


    override func setUpWithError() throws {
        dateFormatterServiceMock = .init()
        priceFormatterMock = .init()
        ticketDetailsInfoModelFactoryMock = .init()
        ticketListModelFactory = TicketListModelFactory(dateFormatterService: dateFormatterServiceMock, priceFormatter: priceFormatterMock, ticketDetailsInfoModelFactory: ticketDetailsInfoModelFactoryMock)
    }

    override func tearDownWithError() throws {
        dateFormatterServiceMock = nil
        priceFormatterMock = nil
        ticketDetailsInfoModelFactoryMock = nil

    }

    func testExample() throws {
        // given
        dateFormatterServiceMock.stubbedLongMonthAndDayResult = "3 октября"
        priceFormatterMock.stubbedGetFormattedPriceResult = "1234"
        let ticket = Ticket(id: "id", departureDateTime: <#T##DateValue<ISO8601Strategy>#>, arrivalDateTime: <#T##DateValue<ISO8601Strategy>#>, price: "price", airline: "airline", availableTicketsCount: 5)
        let origin = Origin(iata: "iata", name: "name")
        
        ticketDetailsInfoModelFactoryMock.ticketListCellModel(ticket: ticket, origin: origin, destination: <#T##Destination#>)


        // when
        ticketListModelFactory.makeTicketListViewModel(model: searchRequestResponceModel) { ticket in
            
        }


        // then
    }
}

