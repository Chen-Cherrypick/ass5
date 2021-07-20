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
    
    
    func searchMovieById(movieId: String, successCallback: @escaping (MovieDetails) -> Void) {
        AF.request("https://movie-database-imdb-alternative.p.rapidapi.com/?i=\(movieId)&r=json",
                   method: .get,
                   headers: headers).responseJSON { response in
                    if let json = response.value, let jsonObject = json as? [String: Any] {
                        successCallback(self.convertJasonToMovieDetails(jsonMovie: jsonObject))
                    }
                   }
        
    }
    
    private func convertJasonToMovieDetails(jsonMovie: [String : Any]) -> MovieDetails {
        return MovieDetails(name: jsonMovie["Title"] as! String, year: jsonMovie["Year"] as! String, image: jsonMovie["Poster"] as! String, id: jsonMovie["imdbID"] as! String, director: jsonMovie["Director"] as! String, plot: jsonMovie["Plot"] as! String, rating: jsonMovie["imdbRating"] as! String, votes: jsonMovie["imdbVotes"] as! String, genre: jsonMovie["Genre"] as! String)
    }
    
    
    
}
