//
//  SearchResponse.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 21/07/2021.
//

import Foundation

class SearchResponse : Codable {
    
    let search : [Movie]


    init(search: [Movie]) {
        self.search = search
    }

    private enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}
