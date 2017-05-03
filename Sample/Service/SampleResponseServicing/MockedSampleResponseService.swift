//
//  MockedSampleResponseService.swift
//  Sample
//
//  Created by ALINA HAMBARYAN on 5/2/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift

public class MockedSampleResponseService : SampleResponseServicing {
    
    public init() {}
    
    public func readConsumables(limit: Int, page: String) -> Observable<SampleResponse?> {
        
        let validJSON = "{\"metadata\": {\"title\": \"Lorem no ipsum lorem rebum ut\",\"cover\": {\"url\": \"https://www.storytel.se/images/customList/15.jpg\"}},\"consumables\": [{\"metadata\": { \"title\": \"Mommy Drinks Because You're Bad\", \"cover\": {\"url\": \"https://www.storytel.se/images/640x640/1024.jpg\"},\"authors\": [{\"id\": \"2\",\"name\": \"Amy Wong\"}],\"narrators\": [{\"id\": \"1\",\"name\": \"Hermes Conrad\"}]}}],\"nextPage\":\"a0c907701bb9482d9878b19d0d3fcb78\"}"
        
        let observable = Observable<SampleResponse?>.create { (observer) -> Disposable in
            if let json = stringToJSON(string: validJSON) {
                observer.onNext(SampleResponse.decode(json).value)
                observer.onCompleted()
            }
            return Disposables.create()
        }
        return observable
    }
}
