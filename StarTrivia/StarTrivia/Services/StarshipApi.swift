//
//  StarshipApi.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 11/1/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import Foundation
import Alamofire

class StarshipApi {
    func getStarship(url: String, completion: @escaping StarshipResponseCompletion){
        
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil)}
            let jsonDecoder = JSONDecoder()
            do {
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
}
