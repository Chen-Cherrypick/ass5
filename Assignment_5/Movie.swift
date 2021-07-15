//
//  Movie.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import Foundation

class Movie {
    
    private let name : String
    private let year : String
    private let image : String
    
    init(name: String, year: String, image: String) {
        self.name = name
        self.year = year
        self.image = image
    }
    
    func getMovieName() -> String {
        return name
    }
    
    func getMovieYear() -> String {
        return year
    }
    
    func getMovieImage() -> String {
        return image
    }
    
}
