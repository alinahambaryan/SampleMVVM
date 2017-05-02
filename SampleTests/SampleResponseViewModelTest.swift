//
//  SampleResponseViewModelTest.swift
//  Sample
//
//  Created by ALINA HAMBARYAN on 5/2/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import XCTest
@testable import Sample

class SampleResponseViewModelTest: XCTestCase {
    
    var testedViewModel : SampleResponseViewModel!
    var service : MockedSampleResponseService!
    
    override func setUp() {
        service = MockedSampleResponseService()
        testedViewModel = SampleResponseViewModel(service: service)
    }
    
    func testSampleResponseViewModel() {
        XCTAssertEqual(testedViewModel.title.value, "Lorem no ipsum lorem rebum ut")
        XCTAssertNotNil(testedViewModel.image.value)
        XCTAssertEqual(testedViewModel.limit.value, 1)
        XCTAssertEqual(testedViewModel.page.value, 1)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
}