//
//  SampleResponseServicing.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift

public protocol SampleResponseServicing {
    
    func readConsumables (limit:Int, page: Int) -> Observable<SampleResponse?>
}
