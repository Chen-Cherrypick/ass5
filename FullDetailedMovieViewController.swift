//
//  FullDetailedMovieViewController.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 18/07/2021.
//

import UIKit

class FullDetailedMovieViewController: UIViewController {
    
    private var movieId : String?
    private var movieYear : String?
    private var imageUrl : URL?
    private var movieTitle : String?
    
    private var movieDetails = MovieDetails()
    
    private var movieAPI = MoviesAPI()
    
    private let defalutImage = "https://mysteriouswritings.com/wp-content/uploads/2017/02/movie.jpg"
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = Colors.darkBlue
        label.numberOfLines = 0
        label.font = label.font.withSize(32)
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightBlue
        return label
    }()
    
    private let genreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.lightBlue
        return label
    }()
    
    private let directorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.lightBlue
        return label
    }()
    
    private let plotLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = Colors.blue
        label.font = label.font.withSize(28)
        return label
    }()
    
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightBlue
        return label
    }()
    
    private let votesLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightBlue
        return label
    }()
    
    
    private let image: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 500, height: 59))
        imageView.center = CGPoint(x: 200, y: 200)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let horizonalStackView   = UIStackView()
    let verticalStackView = UIStackView()
    
    
    lazy var spinner = showLoader(view: view)
    
    
    
    
    convenience init(id: String, title: String, image: String, year: String) {
        self.init()
        movieId = id
        movieTitle = title
        imageUrl = URL(string: image)
        movieYear = year
        spinner = showLoader(view: view)
        movieAPI.searchMovieById(movieId: movieId!) { movie in
            self.spinner.dismissLoader()
            self.movieDetails = movie
            self.updateViewAfterAPICall()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor  = #colorLiteral(red: 0.9306222796, green: 0.9749990106, blue: 0.9715831876, alpha: 1)
        
        titleLable.text = movieTitle
        self.view.addSubview(titleLable)
        self.view.addSubview(image)
        self.view.addSubview(genreLabel)
        self.view.addSubview(directorLabel)
        self.view.addSubview(plotLabel)
        self.view.addSubview(ratingLabel)
        self.view.addSubview(yearLabel)
        self.view.addSubview(yearLabel)
        
        setupTitleLabel()
        
        image.contentMode = UIView.ContentMode.scaleToFill
        if let data = fetchImage() {
            image.image = UIImage(data: data)
        }
        setupImage()
    }
    
    private func updateViewAfterAPICall() {
        yearLabel.text = movieYear
        ratingLabel.text = "⭐️" + movieDetails.getRating()
        votesLabel.text = movieDetails.getVotes() + " votes"
        
        setupHorizonalStackView()
        
        genreLabel.text = "Genre: " + movieDetails.getGenre()
        directorLabel.text = "Directors: " + movieDetails.getDirector()
        
        setupVerticalStackView()
        
        plotLabel.text = "Plot: " + movieDetails.getPlot()
        setupPlotLabel()
    }
    
    private func setupTitleLabel() {
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        let constraints : [NSLayoutConstraint] = [
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3.0),
            titleLable.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -15.0),
            titleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15)
        ]
        view.addConstraints(constraints)
    }
    
    
    private func setupImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        let constraints : [NSLayoutConstraint] = [
            image.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 100)
        ]
        view.addConstraints(constraints)
        
    }
    
    
    private func setupHorizonalStackView() {
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        votesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        horizonalStackView.axis  = NSLayoutConstraint.Axis.horizontal
        horizonalStackView.distribution  = UIStackView.Distribution.equalSpacing
        horizonalStackView.spacing = 20.0
        horizonalStackView.addArrangedSubview(yearLabel)
        horizonalStackView.addArrangedSubview(ratingLabel)
        horizonalStackView.addArrangedSubview(votesLabel)
        horizonalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(horizonalStackView)
        view.addConstraint(horizonalStackView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: -4))
        
    }
    
    
    
    private func setupVerticalStackView() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView.axis  = NSLayoutConstraint.Axis.vertical
        verticalStackView.distribution  = UIStackView.Distribution.equalSpacing
        verticalStackView.alignment = UIStackView.Alignment.leading
        verticalStackView.spacing   = 10.0
        verticalStackView.addArrangedSubview(horizonalStackView)
        verticalStackView.addArrangedSubview(genreLabel)
        verticalStackView.addArrangedSubview(directorLabel)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(verticalStackView)
        let constraints : [NSLayoutConstraint] = [
            verticalStackView.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -5.0),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
            verticalStackView.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 15),
            verticalStackView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        view.addConstraints(constraints)
    }
    
    private func setupPlotLabel() {
        plotLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints : [NSLayoutConstraint] = [
            plotLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
            plotLabel.topAnchor.constraint(lessThanOrEqualTo: verticalStackView.bottomAnchor, constant: 15),
            plotLabel.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            plotLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5.0),
        ]
        view.addConstraints(constraints)
    }
    
    
    private func fetchImage() -> Data? {
        if let url = imageUrl {
            let urlContents = try? Data(contentsOf: url)
            return urlContents
        }
        return nil
        
    }
    
    func showLoader(view: UIView) -> UIActivityIndicatorView {
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.layer.cornerRadius = 3.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = UIActivityIndicatorView.Style.medium;
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        
        return spinner
    }
    
    class Colors {
        static let lightBlue = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        static let blue = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        static let darkBlue = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }
}

extension UIActivityIndicatorView {
    func dismissLoader() {
        self.stopAnimating()
    }
}
