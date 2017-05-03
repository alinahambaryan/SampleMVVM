//
//  SampleResponseService.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift

public class SampleResponseService {
    
    let itemService: SampleResponseServicing
    
    public init(itemService: SampleResponseServicing) {
        self.itemService = itemService
    }
    
    func readConsumables (limit:Int, page: String) -> Observable<SampleResponse?> {
        return self.itemService.readConsumables(limit:limit, page:page)
    }
}
