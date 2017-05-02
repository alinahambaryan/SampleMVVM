//
//  SwinjectStoryboard+Extension.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import SwinjectStoryboard
import Swinject

extension SwinjectStoryboard {
    class func setup() {
        registerBookListView()
    }
    
    static func registerBookListView() {
        defaultContainer.storyboardInitCompleted(BookListViewController.self) { r, c in
            let assembler = try? Assembler(assemblies: [SampleResponseServiceAssembly(), SampleResponseViewAssembly()])
            c.viewModel = assembler?.resolver.resolve(SampleResponseViewModel.self)
        }
    }
}
