//
//  Movie.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import Foundation

class Movie : Codable {
    
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
    
    private enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case name = "Title"
        case year = "Year"
        case image = "Poster"
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.year = try container.decode(String.self, forKey: .year)
        self.id = try container.decode(String.self, forKey: .id)
        self.image = try container.decode(String.self, forKey: .image) != "N/A" ? container.decode(String.self, forKey: .image) : "https://mysteriouswritings.com/wp-content/uploads/2017/02/movie.jpg"
    }
    
}
