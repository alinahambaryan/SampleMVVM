//
//  BookCellViewModel.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import RxSwift

class BookCellViewModel {
    
    let title = Variable<String>("")
    let narrator = Variable<String>("")
    let author = Variable<String>("")
    let imageURL = Variable<String>("")

    init (consumable: Consumable) {
        self.title.value = consumable.title
        self.imageURL.value = consumable.coverURL

        var narrators = "With: "
        for value in consumable.narrators {
            narrators.append(value.name)
            narrators.append(", ")
        }
        self.narrator.value = String(narrators.characters.dropLast(2))
        
        var authors = "By: "
        for value in consumable.authors {
            authors.append(value.name)
            authors.append(", ")
        }
        self.author.value = String(authors.characters.dropLast(2))
    }
}
