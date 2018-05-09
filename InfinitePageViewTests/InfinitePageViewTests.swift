//
//  InfinitePageViewTests.swift
//  InfinitePageViewTests
//
//  Created by NishiokaKohei on 2018/05/04.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import XCTest
@testable import InfinitePageView

class InfinitePageViewTests: XCTestCase {

    var pageView: InfinitePageView?
    
    override func setUp() {
        super.setUp()
        // Initialize
        pageView = InfinitePageView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testAddPage() {
        // given
        let pageItem = PageItemView(frame: CGRect.zero, title: "")
        let pageContent = PageContentView(frame: CGRect.zero)
        let page = InfinitePage(index: 0, item: pageItem, content: pageContent, offset: 0.0, size: CGSize(width: 0.0, height: 0.0))

        // when
        pageView?.addPage(page)

        // then
        let first = pageView!.dataSource.first!
        XCTAssertTrue(first == page)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
