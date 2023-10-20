//
//  GuessTheFlagUITests.swift
//  GuessTheFlagUITests
//
//  Created by Martin Lienhard on 4/6/21.
//

import XCTest

class GuessTheFlagUITests: XCTestCase {
    private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    private var incorrectScoreTitle:String = "Wrong! That’s the flag of"
    private var correctScoreTitle:String = "Correct"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override class func setUp() {
            // UI tests must launch the application that they test.
            let app = XCUIApplication()
            app.launchArguments = ["enable-testing"]
            app.launch()
        }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        app.buttons["Russia"].tap()
        
        let alert = app.alerts["\(incorrectScoreTitle) Italy"].scrollViews.otherElements
        alert.staticTexts["\(incorrectScoreTitle) Italy"].swipeRight()
        alert.buttons["Continue"].tap()
        app.buttons["button"].tap()
        app.alerts["\(incorrectScoreTitle) Russia"].scrollViews.otherElements.buttons["Continue"].tap()
                
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
