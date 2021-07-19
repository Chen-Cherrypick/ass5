//
//  MovieTableViewController.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 15/07/2021.
//

import UIKit

class CollectionMoviesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var dataMovies = MoviesAPI()
    
    @IBAction func searchMovies(_ sender: UIButton) {
        moviesCollection.isHidden = !moviesCollection.isHidden
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flowLayout?.itemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout?.estimatedItemSize = CGSize(width: 200, height: 281)
    }
    
    private var flowLayout: UICollectionViewFlowLayout? {
        return moviesCollection?.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    
    @IBOutlet weak var moviesCollection: UICollectionView! {
        didSet {
            moviesCollection.dataSource = self
            moviesCollection.delegate = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionMovieCell", for: indexPath)
//        let movie = dataMovies.getMovie(by: indexPath.row)
//
//        if let customCell = cell as? MovieCollectionViewCell {
//            customCell.name.text = movie["Title"] as? String
//            customCell.year.text = movie["Year"] as? String
//            if let stringUrlImage = movie["Poster"] as? String {
//                customCell.imageURL = URL(string: stringUrlImage)
//            }
//
//        }
        
        
        return cell
    }
    
    
    
    //    func collectionView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let movie = dataMovies.getMovie(by: indexPath.row)
    //        let movieId = movie["imdbID"] as! String
    //        let movieTitle = movie["Title"] as! String
    //        let image = movie["Poster"] as! String
    //        let year = movie["Year"] as! String
    //
    //        let vc = FullDetailedMovieViewController(id: movieId, title: movieTitle, image: image, year: year)
    //
    //        navigationController?.pushViewController(vc, animated: true)
    //    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let movie = dataMovies.getMovie(by: indexPath.row)
//        let movieId = movie["imdbID"] as! String
//        let movieTitle = movie["Title"] as! String
//        let image = movie["Poster"] as! String
//        let year = movie["Year"] as! String
//
//        let vc = FullDetailedMovieViewController(id: movieId, title: movieTitle, image: image, year: year)
//
//        navigationController?.pushViewController(vc, animated: true)
    }
}
