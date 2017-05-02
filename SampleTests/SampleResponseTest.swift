//
//  SampleResponseTest.swift
//  Sample
//
//  Created by ALINA HAMBARYAN on 5/2/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import XCTest
import Sample
import Argo

class SampleResponseTest: XCTestCase {
    let validJSON = "{\"metadata\": {\"title\": \"Lorem no ipsum lorem rebum ut\",\"cover\": {\"url\": \"https://www.storytel.se/images/customList/15.jpg\"}},\"consumables\": [{\"metadata\": { \"title\": \"Mommy Drinks Because You're Bad\", \"cover\": {\"url\": \"https://www.storytel.se/images/640x640/1024.jpg\"},\"authors\": [{\"id\": \"2\",\"name\": \"Amy Wong\"}],\"narrators\": [{\"id\": \"1\",\"name\": \"Hermes Conrad\"}]}}]}"
    
    func testDecodeSampleResponseWithValidJSON() {
        if let json = stringToJSON(string: validJSON) {
            let response = SampleResponse.decode(json)
            XCTAssertEqual(response.value?.listTitle, "Lorem no ipsum lorem rebum ut")
        } else {
            XCTFail("Should not be nil")
        }
    }
    
    func testDecodeSampleResponseWithInvalidJSON() {
        let inValidJSON = "{\"metadata\": {},\"consumables\": {}}"
        
        if let json = stringToJSON(string: inValidJSON) {
            let response = SampleResponse.decode(json)
            XCTAssertNil(response.value)
        } else {
            XCTFail("Should be nil")
        }
    }
}
