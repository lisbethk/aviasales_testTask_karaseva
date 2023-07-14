//
//  aviasales_testTask_karasevaUITests.swift
//  aviasales_testTask_karasevaUITests
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import XCTest

final class aviasales_testTask_karasevaUITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        continueAfterFailure = false
    }

    func testUserProfileExistingElements() throws {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()

        //        проверка наличия на экране элементов
//        XCTAssertTrue(app.staticTexts[].exists)
//        XCTAssertTrue(app.staticTexts.matching(identifier: "TicketListToolBar").element.exists)
//        XCTAssertTrue(app.staticTexts.matching(identifier: "OriginDestinationLabel").element.exists)

        XCTAssertTrue(app.navigationBars.element.exists)
        XCTAssertTrue(app.staticTexts.matching(identifier: "PriceLabel").element.firstMatch.exists)
        XCTAssertTrue(app.staticTexts.matching(identifier: "NumberOfTicketsLabel").element.firstMatch.exists)
        XCTAssertTrue(app.images.matching(identifier: "CompanyIcon").element.firstMatch.exists)

//        XCTAssertTrue(app.collectionViews.cells.matching(identifier: "ListCell").firstMatch.exists)

//        app.tableRows.cells.matching(identifier: "ListCell").firstMatch.tap()


    }
}
