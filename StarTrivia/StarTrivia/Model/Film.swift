//
//  Film.swift
//  StarTrivia
//
//  Created by Ezekiel De Leon on 11/2/18.
//  Copyright © 2018 Ezekiel De Leon. All rights reserved.
//

import Foundation

struct Film: Codable {
    
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseDate = "release_date"
    }
    
}
