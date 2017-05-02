//
//  SampleResponseViewAssembly.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Swinject

public class SampleResponseViewAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        container.register(SampleResponseViewModel.self) { r in
            SampleResponseViewModel(service: r.resolve(SampleResponseService.self)!)
        }
    }
}
