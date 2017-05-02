//
//  SampleResponse.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct SampleResponse {
    public let listTitle: String
    public let listCoverURL: String
    public let consumables:[Consumable]
}

extension SampleResponse: Decodable {
    public static func decode(_ j: JSON) -> Decoded<SampleResponse> {
        return curry(SampleResponse.init)
            <^> j <| ["metadata","title"]
            <*> j <| ["metadata","cover","url"]
            <*> j <|| "consumables"
    }
}
