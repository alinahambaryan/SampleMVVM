//
//  SampleResponseServiceAssembly.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Swinject

public class SampleResponseServiceAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        registerSampleResponseServices(container: container)
        registerServiceContainiers(container: container)
    }
    
    public func registerSampleResponseServices(container:Container){
        container.register(SampleResponseServicing.self) { r in
            return SampleResponseWebService()
        }
    }
    
    public func registerServiceContainiers(container:Container) {
        container.register(SampleResponseService.self) { r in
            return SampleResponseService(itemService: r.resolve(SampleResponseServicing.self)!)
        }
    }
}
