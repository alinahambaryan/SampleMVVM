//
//  SampleResponseViewModel.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import UIKit

public class SampleResponseViewModel: ViewModel<SampleResponseServicing> {
    
    public var title = Variable<String>("")
    public var image = Variable<UIImage?>(nil)
    public var limit = Variable<Int>(1)
    public var nextPage = Variable<String>("")
    let cellViewModels = Variable<[BookCellViewModel]>([])

    public override init(service: SampleResponseServicing) {
        super.init(service: service)
        
        fetchConsumables(limit: self.limit.value, page: "")
    }
    
    func fetchConsumables(limit:Int, page:String) {
        service.readConsumables(limit: self.limit.value, page: self.nextPage.value)
            .asObservable()
            .subscribe(onNext: { [unowned self](response) in
                if let sampleResponse = response {
                    self.title.value = sampleResponse.listTitle
                    self.nextPage.value = sampleResponse.nextPage
                    self.prepareCoverImage(url: sampleResponse.listCoverURL)
                    self.prepareCellViewModels(consumables: sampleResponse.consumables)
                }
                }, onError: { (error) in
                    print(error.localizedDescription)
            }, onCompleted: {
                print("completed")
            }) {
            }.addDisposableTo(disposeBag)
    }
    
    func prepareCellViewModels(consumables: [Consumable]) {
        
        let newPageConsumables = consumables.map {BookCellViewModel(consumable: $0)}
        self.cellViewModels.value.append(contentsOf: newPageConsumables)
    }
    
    func prepareCoverImage(url:String) {
        if let url = NSURL(string: url) {
            if let imageData = NSData(contentsOf: url as URL) {
                let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
                let data: NSData = NSData(base64Encoded: str64 , options: .ignoreUnknownCharacters)!
                self.image.value = UIImage(data: data as Data)
            }
        }
    }
}
