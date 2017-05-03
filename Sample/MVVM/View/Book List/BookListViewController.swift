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

class BookListViewController: ViewController<SampleResponseViewModel>, UITableViewDelegate{
    
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var listCoverImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        return spinner
    }()
    
    static let startLoadingOffset: CGFloat = 50.0
    static func isNearTheBottomEdge(contentOffset: CGPoint, _ tableView: UITableView) -> Bool {
        return contentOffset.y + tableView.frame.size.height + startLoadingOffset > tableView.contentSize.height
    }
    
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
        
        tableView.rx.contentOffset
            .flatMap { offset in
                BookListViewController.isNearTheBottomEdge(contentOffset: offset, self.tableView)
                    ? Observable.just()
                    : Observable.empty()
            }.subscribe(onNext: { [unowned self] results in
                self.tableView.tableFooterView?.isHidden = false
                self.tableView.tableFooterView = self.spinner
                viewModel.fetchConsumables(limit: (self.viewModel?.limit.value)!, page: (self.viewModel?.nextPage.value)!)
            })
            .disposed(by: disposeBag)
    }
}
