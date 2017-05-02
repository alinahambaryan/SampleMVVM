//
//  ViewModel.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift

public protocol ViewModeling {
    var error: Variable<Error?> {get}
    var isLoading: Variable<Bool?> {get}
}

public class ViewModel<T>: ViewModeling {
    
    public let service: T
   
    public let disposeBag = DisposeBag()
    
    public let error = Variable<Error?>(nil)
    
    public var isLoading = Variable<Bool?>(nil)
    
    public init(service: T){
        self.service = service
    }
    
    public func handleEvent<R>(event: Event<R>, dataHandler: (R) -> Void) {
        switch event {
        case.next (let response):
            if let error = handleSuccess(data: response){
                self.error.value = error
            } else {
                dataHandler(response)
            }
        case .error(let error):
            self.error.value = error
        case .completed:
            break
        }
    }
    
    public func handleSuccess(data: Any) ->Error?{
        return nil
    }
}
