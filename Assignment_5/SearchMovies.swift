//
//  SearchMovies.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import Foundation

struct SearchMovies {
    
    var movies = [Movie]()

    
    var jsonMovies = """
           [
           {"Poster": "https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_SX300.jpg",
           "Title": "The Lion King",
           "Type": "movie",
           "Year": "1994",
           "imdbID": "tt0110357"
           }
           ,
           {
           "Poster": "https://m.media-amazon.com/images/M/MV5BMTc0NTUwMTU5OV5BMl5BanBnXkFtZTcwNjAwNzQzMw@@._V1_SX300.jpg",
           "Title": "The Chronicles of Narnia",
           "Type": "movie",
           "Year": "2005",
           "imdbID": "tt0363771"
           }
           ,
           {
           "Poster": "https://m.media-amazon.com/images/M/MV5BMjA3NjkzNjg2MF5BMl5BanBnXkFtZTgwMDkyMzgzMDI@._V1_SX300.jpg",
           "Title": "Lion",
           "Type": "movie",
           "Year": "2016",
           "imdbID": "tt3741834"
           }
                       ]
       """
    let dictionaryMovies : [[String : Any]]
    
    init() {
        guard let jsonData = jsonMovies.data(using: .utf8) else {
            fatalError("Unable to convert UnitTestData.json to Data")
        }
//            print(type(of: jsonMovies))
    guard let jsonDictionary: [[String: AnyObject]] = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [[String:AnyObject]] else {
            fatalError("Unable to convert UnitTestData.json to JSON dictionary")
        }
        self.dictionaryMovies = jsonDictionary
       
    }
    
    
    func getMovie(by index: Int) -> [String : Any]  {
        return dictionaryMovies[index]
          
      }
    
    

}
