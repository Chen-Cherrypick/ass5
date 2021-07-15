//
//  MovieTableViewCell.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 14/07/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var imageURL: URL? {
        didSet {
            movieImage.image = nil
            fetchImage()
        }
    }


    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var name: UILabel!
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                movieImage.contentMode = UIView.ContentMode.scaleAspectFit
                movieImage.image = UIImage(data: imageData)
            }
        }
        
    }
    
}
