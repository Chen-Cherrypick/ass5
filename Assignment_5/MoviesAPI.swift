//
//  SearchMovies.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import Foundation
import Alamofire

class MoviesAPI {
    
        
    let headers : HTTPHeaders = [
        "x-rapidapi-key": "f80ac4d453msh0bf3e3080de58b9p192bcfjsn86ef8518a220",
        "x-rapidapi-host": "movie-database-imdb-alternative.p.rapidapi.com"
    ]
    
    func searchMovies(with keyword: String, successCallback: @escaping ([Movie]) -> Void) {
        if keyword.count > 0 {
            let newKeyword = keyword.replacingOccurrences(of: " ", with: "%20")
            AF.request("https://movie-database-imdb-alternative.p.rapidapi.com/?s=(\(newKeyword)&page=1&r=json",
                       method: .get,
                       headers: headers).responseJSON { response in
                        if let json = response.value, let jsonObject = json as? [String: Any] {
                            if let searchData = jsonObject["Search"] as? [[String: Any]] {
                                successCallback(self.moviesDictionary(jsonMovies: searchData))
                            }
                        }
                       }
        }
    }
    
    
    private func moviesDictionary(jsonMovies : [[String: Any]]) -> [Movie] {
        var movies = [Movie]()
        for movieJson in jsonMovies {
            let movie = Movie(name: (movieJson["Title"] as? String)!, year: movieJson["Year"] as! String, image: movieJson["Poster"] as! String, id: movieJson["imdbID"] as! String)
            movies.append(movie)
        }
        return movies
    }
    
    
    
}
