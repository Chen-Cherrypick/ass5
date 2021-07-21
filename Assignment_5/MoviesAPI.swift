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
                       headers: headers).response { response in
                        if let jsonData = response.data,
                           let res: SearchResponse = try? JSONDecoder().decode(SearchResponse.self, from: jsonData) {
                            successCallback(res.search)
                        } else {
                            successCallback([])
                        }
                       }
        }
    }
    
    
    func searchMovieById(movieId: String, successCallback: @escaping (MovieDetails) -> Void) {
        AF.request("https://movie-database-imdb-alternative.p.rapidapi.com/?i=\(movieId)&r=json",
                   method: .get,
                   headers: headers).response { response in
                    if let jsondata = response.data,
                       let res: MovieDetails = try? JSONDecoder().decode(MovieDetails.self, from: jsondata){
                        successCallback(res)
                    }
                   }
        
    }
}
