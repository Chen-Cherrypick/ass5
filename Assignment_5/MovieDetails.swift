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

class MovieDetails : Codable {
    
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
    
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case name = "Title"
        case year = "Year"
        case image = "Poster"
        case director = "Director"
        case plot = "Plot"
        case rating = "imdbRating"
        case votes = "imdbVotes"
        case genre = "Genre"
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
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.year = try container.decode(String.self, forKey: .year)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image) != "N/A" ? container.decode(String.self, forKey: .image) : "https://mysteriouswritings.com/wp-content/uploads/2017/02/movie.jpg"
        self.plot = try container.decode(String.self, forKey: .plot)
        self.rating = try container.decode(String.self, forKey: .rating)
        self.votes = try container.decode(String.self, forKey: .votes)
        self.director = try container.decode(String.self, forKey: .director)
        self.genre = try container.decode(String.self, forKey: .genre)
    }
    
}

