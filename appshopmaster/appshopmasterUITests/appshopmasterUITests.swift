//
//  appshopmasterUITests.swift
//  appshopmasterUITests
//
//  Created by Alan Fagner Goncalves on 11/05/26.
//

import XCTest

final class appshopmasterUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testAddAndRemoveProductFromCart() throws {
        let app = XCUIApplication()
        app.launch()

        app.tabBars.buttons["Categorias"].tap()

        let rodsSection = app.buttons["sectionCard.rods"]
        XCTAssertTrue(rodsSection.waitForExistence(timeout: 2))
        rodsSection.tap()

        let addButton = app.buttons["addToCart.shoreline-carbon-66"]
        XCTAssertTrue(addButton.waitForExistence(timeout: 2))
        addButton.tap()

        app.tabBars.buttons["Carrinho"].tap()

        let quantityLabel = app.staticTexts["cartQuantity.shoreline-carbon-66"]
        XCTAssertTrue(quantityLabel.waitForExistence(timeout: 2))
        XCTAssertEqual(quantityLabel.label, "1")

        let totalLabel = app.staticTexts["cartTotalValue"]
        XCTAssertTrue(totalLabel.waitForExistence(timeout: 2))
        XCTAssertTrue(totalLabel.label.contains("899"))

        let removeButton = app.buttons["removeFromCart.shoreline-carbon-66"]
        XCTAssertTrue(removeButton.exists)
        removeButton.tap()

        XCTAssertTrue(app.staticTexts["Seu carrinho ainda está vazio"].waitForExistence(timeout: 2))
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
