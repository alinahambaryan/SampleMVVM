//
//  Argo.swift
//  Sample
//
//  Created by ALINA HAMBARYAN on 5/2/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Argo

public func stringToJSON(string: String) -> JSON? {
    let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
    if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
        return decode(json)
    }
    return nil
}
