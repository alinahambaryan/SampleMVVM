//
//  Person.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Person {
    public let id: String
    public let name: String
}

extension Person: Decodable {
    public static func decode(_ j: JSON) -> Decoded<Person> {
        return curry(Person.init)
            <^> j <| "id"
            <*> j <| "name"
    }
}
