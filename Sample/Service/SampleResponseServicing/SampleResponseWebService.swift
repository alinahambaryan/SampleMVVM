//
//  SampleResponseWebService.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes
import RxSwift

public class SampleResponseWebService : SampleResponseServicing {

    public init() {}
    
    public func readConsumables(limit: Int, page: Int) -> Observable<SampleResponse?> {
        return Observable.create { observer in
            DataSource.fetchSampleRequest(limit: limit, page: page, completionHandler: { (response, error) in
                if error != nil {
                    fatalError("OPSS: \(String(describing: error))")
                }
                observer.onNext(response)
            })
            return Disposables.create {
            }
        }
    }
}
