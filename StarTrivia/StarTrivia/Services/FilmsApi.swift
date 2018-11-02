//
//  FilmsApi.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 11/2/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import Foundation
import Alamofire

class FilmsApi {
    func getFilm(url: String, completion: @escaping FilmsResponseCompletion) {
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
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            
        }
    }
}
