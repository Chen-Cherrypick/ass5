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
    private var image  = "https://mysteriouswritings.com/wp-content/uploads/2017/02/movie.jpg"
    private let id : String
    
    
    init(name: String, year: String, image: String, id: String) {
        self.name = name
        self.year = year
        self.id = id
        if image != "N/A" {
            self.image = image
        }
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
    
    func getMovieId() -> String {
        return id
    }
    
    
    
    
    
}
