//
//  ViewController.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController<T: ViewModeling>: UIViewController {
    var    viewModel: T?
    lazy public var disposeBag = DisposeBag()
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vm = viewModel {
            bindViewModel(vm)
        }
    }
    func bindViewModel(_ viewModel: T) {}
}
