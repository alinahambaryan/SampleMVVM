//
//  BookListViewController.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class BookListViewController: ViewController<SampleResponseViewModel>, UITableViewDelegate{
    
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listCoverImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func bindViewModel(_ viewModel: SampleResponseViewModel) {
        super.bindViewModel(viewModel)
        
        bindHeader(viewModel)
        bindTableView(viewModel)
    }
    
    func bindHeader(_ viewModel: SampleResponseViewModel) {
        viewModel.title
            .asObservable()
            .map { $0 }
            .bind(to: listTitleLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.image
            .asDriver()
            .drive(listCoverImageView.rx.image)
            .disposed(by: disposeBag)
    }
    
    func bindTableView(_ viewModel: SampleResponseViewModel) {
        viewModel.cellViewModels
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "BookCell", cellType: BookCell.self)) {
                (row, element, cell) in cell.configure(with: element)
            }
            .disposed(by: disposeBag)
    }
}
