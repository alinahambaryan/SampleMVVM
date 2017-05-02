//
//  BookCell.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class BookCell : UITableViewCell {
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var narratorLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    func configure(with:BookCellViewModel){
        authorLabel.text = with.author.value
        titleLabel.text = with.title.value
        narratorLabel.text = with.narrator.value
        coverImageView.af_setImage(withURL: URL(string: with.imageURL.value)!)
    }
}
