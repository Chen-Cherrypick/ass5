//
//  MovieCollectionViewCell.swift
//  Assignment_5
//
//  Created by Chen Shoresh on 15/07/2021.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var imageURL: URL? {
        didSet {
            imageCell.image = nil
            fetchImage()
        }
    }
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var year: UILabel!
    
    
    private func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageCell.contentMode = UIView.ContentMode.scaleToFill
                imageCell.image = UIImage(data: imageData)
            }
        }
        
    }
}
