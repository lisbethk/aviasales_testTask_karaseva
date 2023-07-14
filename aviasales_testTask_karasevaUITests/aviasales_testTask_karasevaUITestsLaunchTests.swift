//
//  aviasales_testTask_karasevaUITestsLaunchTests.swift
//  aviasales_testTask_karasevaUITests
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import XCTest

final class aviasales_testTask_karasevaUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

