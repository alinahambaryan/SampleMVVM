//
//  Data.swift
//  PE
//
//  Created by ALINA HAMBARYAN on 5/1/17.
//  Copyright © 2017 ALINA HAMBARYAN. All rights reserved.
//

import Foundation
import Alamofire
import Argo
import Runes

class DataSource{
    
    static func fetchSampleRequest(limit:Int, page:String, completionHandler: @escaping (SampleResponse?, Error?) -> ()){
        let urlString = Constants.URLs.sampleURL + String(limit) + "?page=" + page
        let request = URLRequest(url: URL(string: urlString)!)
        
        Alamofire.request(request).validate().responseJSON { response in
            switch response.result {
            case .success:
                if let j: Any = response.result.value {
                    let decodedResponse: Decoded<SampleResponse> = decode(j)
                    completionHandler(decodedResponse.value, decodedResponse.error)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil, error)
            }
        }
    }
}
