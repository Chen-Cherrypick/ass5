//
//  MovieDetails.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 20/07/2021.
//

import Foundation

//
//  Movie.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import Foundation

class MovieDetails {
    
    private var name : String
    private var year : String
    private var image : String
    private var id : String
    
    private var director : String
    private var plot : String
    private var rating : String
    private var votes : String
    private var genre : String
    
    init(name: String, year: String, image: String, id: String, director: String, plot: String, rating: String, votes: String, genre: String) {
        self.name = name
        self.year = year
        self.image = image
        self.id = id
        self.director = director
        self.plot = plot
        self.rating = rating
        self.votes = votes
        self.genre = genre
    }
    
    
    init () {
        self.name = ""
        self.year = ""
        self.image = ""
        self.id = ""
        self.director = ""
        self.plot = ""
        self.rating = ""
        self.votes = ""
        self.genre = ""
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
    
    func getDirector() -> String {
        return director
    }
    
    func getPlot() -> String {
        return plot
    }
    
    func getVotes() -> String {
        return votes
    }
    
    func getRating() -> String {
        return rating
    }
    
    func getGenre() -> String {
        return genre
    }
    
    
}

