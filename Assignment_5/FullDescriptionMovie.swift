//
//  FullDescriptionMovie.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 18/07/2021.
//

import Foundation

class FullDescriptionMovie {
    
    var jsonlionking = """
            {
                "Title": "The Lion King",
                "Year": "1994",
                "Rated": "G",
                "Released": "24 Jun 1994",
                "Runtime": "88 min",
                "Genre": "Animation, Adventure, Drama, comedy, Cartoon",
                "Director": "Roger Allers, Rob Minkoff, Chen Shoresh",
                "Writer": "Irene Mecchi, Jonathan Roberts, Linda Woolverton",
                "Actors": "Matthew Broderick, Jeremy Irons, James Earl Jones",
                "Plot": "Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself.",
                "Language": "English, Swahili, Xhosa, Zulu",
                "Country": "United States",
                "Awards": "Won 2 Oscars. 39 wins & 35 nominations total",
                "Poster": "https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_SX300.jpg",
                "Ratings": [
                    {
                        "Source": "Internet Movie Database",
                        "Value": "8.5/10"
                    },
                    {
                        "Source": "Rotten Tomatoes",
                        "Value": "93%"
                    },
                    {
                        "Source": "Metacritic",
                        "Value": "88/100"
                    }
                ],
                "Metascore": "88",
                "imdbRating": "8.5",
                "imdbVotes": "967,250",
                "imdbID": "tt0110357",
                "Type": "movie",
                "DVD": "15 Aug 2017",
                "BoxOffice": "$422,783,777",
                "Production": "Walt Disney Pictures",
                "Website": "N/A",
                "Response": "True"
            }
            """
    
    var dictionary : [String : Any]
    
    init() {
        guard let jsonData = jsonlionking.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
    guard let jsonDictionary: [String: AnyObject] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String:AnyObject] else {
            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
        }
        self.dictionary = jsonDictionary
       
    }
    
}
