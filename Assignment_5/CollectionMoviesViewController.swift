//
//  MovieTableViewController.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 15/07/2021.
//

import UIKit

class CollectionMoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    
    var dataMovies = MoviesAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout?.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout?.estimatedItemSize = CGSize(width: 200, height: 291)
    }
    
    private var flowLayout: UICollectionViewFlowLayout? {
        return moviesCollection?.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        keyWordSearch = textField.text ?? ""
        if keyWordSearch.count >= 3 {
            dataMovies.searchMovies(with: keyWordSearch) { movies in
                self.movies = movies
                self.moviesCollection.reloadData()
            }
        } else {
            self.movies.removeAll()
            self.moviesCollection.reloadData()
        }
    }
    
    
    var movies : [Movie] = []
    
    var keyWordSearch = ""
    
    @IBOutlet weak var moviesCollection: UICollectionView! {
        didSet {
            moviesCollection.dataSource = self
            moviesCollection.delegate = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionMovieCell", for: indexPath)
        let movie = movies[indexPath.row]
        
        if let customCell = cell as? MovieCollectionViewCell {
            customCell.name.text = movie.getMovieName()
            customCell.year.text = movie.getMovieYear()
            customCell.imageURL = URL(string: movie.getMovieImage())
        }
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie =  movies[indexPath.row]
        let movieId = movie.getMovieId()
        let movieTitle = movie.getMovieName()
        let image = movie.getMovieImage()
        let year = movie.getMovieYear()
        
        let vc = FullDetailedMovieViewController(id: movieId, title: movieTitle, image: image, year: year)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
