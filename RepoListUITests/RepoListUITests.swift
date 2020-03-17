//
//  RepoListUITests.swift
//  RepoListUITests
//
//  Created by Marina Azevedo Ferreira Soares on 13/03/20.
//  Copyright © 2020 Marina Azevedo Ferreira Soares. All rights reserved.
//

import XCTest

class RepoListUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launch()
        
        continueAfterFailure = false

    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }

    func testVC() {
        app.launch()
        let title = app.navigationBars.textFields["JavaPop"]
        let tableView = app.tables["tableView"]
        
        XCTAssertTrue(title.exists)
        XCTAssertTrue(tableView.exists)
    }
    
    func testCell() {
        app.launch()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["CS-Notes"]/*[[".cells.staticTexts[\"CS-Notes\"]",".staticTexts[\"CS-Notes\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
        let tablesQuery = app.tables["JavaGuide"]
        
        let closed = tablesQuery.segmentedControls.buttons["Closed"]
        let open = tablesQuery.segmentedControls.buttons["Open"]
        
        if open.isSelected {
          XCTAssertTrue(open.exists)
          XCTAssertFalse(closed.exists)

          closed.tap()
          XCTAssertTrue(closed.exists)
          XCTAssertFalse(open.exists)
        } else if closed.isSelected {
          XCTAssertTrue(closed.exists)
          XCTAssertFalse(open.exists)

          open.tap()
          XCTAssertTrue(open.exists)
          XCTAssertFalse(closed.exists)
        }
    }
}
