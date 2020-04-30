//
//  TestAppTests.swift
//  TestAppTests
//
//  Created by Jakub Lawicki on 30 Apr 20.
//  Copyright © 2020 Secret Inc. All rights reserved.
//

import XCTest
@testable import TestApp

class TestAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSubviewsOf() {
        let emptyView = UIView()
        let subviews : [UIView] = getSubviewsOf(emptyView)
        XCTAssertTrue(subviews.count == 0, "The empty view should have 0 subviews")

        // Test class
        let view1 = UIView()
        view1.addSubview(UIButton())
        let subviews1 : [UIView] = getSubviewsOf(view1)
        XCTAssertTrue(subviews1.count == 1, "The view should have 1 subview")
        let subviews11 : [UIButton] = getSubviewsOf(view1)
        XCTAssertTrue(subviews11.count == 1, "The view should have 1 subview of type UIButton")
        let subviews111 : [UITextField] = getSubviewsOf(view1)
        XCTAssertTrue(subviews111.count == 0, "The view should have 1 subview of type UIButton")

        // Test recursion
        let view2 = UIView()
        view2.addSubview(UIButton())
        let view3 = UIView()
        view2.addSubview(view3)
        view3.addSubview(UITextField())

        let subviews2 : [UITextField] = getSubviewsOf(view2)
        XCTAssertTrue(subviews2.count == 1, "View should have 1 subview of type UITextField")
        let subviews22 : [UIButton] = getSubviewsOf(view2)
        XCTAssertTrue(subviews22.count == 1, "View should have 1 subview of type UIButton")
        let subviews3 : [UIButton] = getSubviewsOf(view3)
        XCTAssertTrue(subviews3.count == 0, "View should have 0 subviews of type UIButton")
        let subviews33 : [UITextField] = getSubviewsOf(view3)
        XCTAssertTrue(subviews33.count == 1, "View should have 1 subview of type UITextField")
    }
}
