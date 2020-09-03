//
//  MovieCell.swift
//  Movies-tvOS
//
//  Created by Shakoushy on 9/3/20.
//  Copyright © 2020 Elshakoushy. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    
    func configureCell(movie: Movie) {
        if let title = movie.title {
            movieTitle.text = title
        }
        if let path = movie.posterPath {
            let url = URL(string: path)!
            DispatchQueue.global(qos: .background).async {
                DispatchQueue.main.async {
                    do {
                        let data = try Data(contentsOf: url)
                        let img = UIImage(data: data)
                        self.movieImg.image = img
                    } catch {
                        
                    }

                }
            }
        }
    }
}
