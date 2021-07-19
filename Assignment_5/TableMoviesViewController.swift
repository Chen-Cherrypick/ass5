//
//  TableMoviesViewController.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 15/07/2021.
//

import UIKit

class TableMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 170
    }
    
    @IBAction func searchbtn(_ sender: UIButton) {
        tableView.isHidden = !tableView.isHidden
    }
    
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    
    
    var dataMovies = SearchMovies()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataMovies.dictionaryMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = dataMovies.getMovie(by: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell",
                                                 for: indexPath)
        if let customCell = cell as? MovieTableViewCell {
            customCell.name.text = movie["Title"] as? String
            customCell.year.text = movie["Year"] as? String
            if let stringUrlImage = movie["Poster"] as? String {
                customCell.imageURL = URL(string: stringUrlImage)
            }
            
        }
        
 
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = dataMovies.getMovie(by: indexPath.row)
        let movieId = movie["imdbID"] as! String
        let movieTitle = movie["Title"] as! String
        let image = movie["Poster"] as! String
        let year = movie["Year"] as! String
        
        let vc = FullDetailedMovieViewController(id: movieId, title: movieTitle, image: image, year: year)

        navigationController?.pushViewController(vc, animated: true)
    }

    
 

    
  
}
