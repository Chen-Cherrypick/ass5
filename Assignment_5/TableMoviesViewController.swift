//
//  TableMoviesViewController.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 15/07/2021.
//

import UIKit

class TableMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
    }
    


    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    var movies : [Movie] = []
    
    var keyWordSearch = ""
    
    var dataMovies = MoviesAPI()
    
    func textFieldDidChangeSelecotion(_ textField: UITextField) {
        keyWordSearch = textField.text ?? ""
        if keyWordSearch.count >= 3 {
            dataMovies.searchMovies(with: keyWordSearch) { movies in
                self.movies = movies
                self.tableView.reloadData()
            }
        } else {
            self.movies.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = movies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                 for: indexPath)
        if let customCell = cell as? MovieTableViewCell {
            customCell.name.text = movie.getMovieName()
            customCell.year.text = movie.getMovieYear()
            customCell.imageURL = URL(string: movie.getMovieImage())
        }
        
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let movieId = movie.getMovieId()
        let movieTitle = movie.getMovieName()
        let image = movie.getMovieImage()
        let year = movie.getMovieYear()
        
        let vc = FullDetailedMovieViewController(id: movieId, title: movieTitle, image: image, year: year)

        navigationController?.pushViewController(vc, animated: true)
    }

    
 

    
  
}
