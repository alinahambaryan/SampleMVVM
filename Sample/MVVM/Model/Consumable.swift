//
//  Consumable.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Consumable {
    public let title: String
    public let coverURL: String
    public let authors: [Person]
    public let narrators: [Person]
}

extension Consumable: Decodable {
    public static func decode(_ j: JSON) -> Decoded<Consumable> {
        return curry(Consumable.init)
            <^> j <| ["metadata","title"]
            <*> j <| ["metadata","cover","url"]
            <*> j <|| ["metadata","authors"]
            <*> j <|| ["metadata","narrators"]
    }
}
