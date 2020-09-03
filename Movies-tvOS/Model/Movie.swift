//
//  Movie.swift
//  Movies-tvOS
//
//  Created by Shakoushy on 9/3/20.
//  Copyright © 2020 Elshakoushy. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String!
    var overview: String!
    var posterPath: String!
    
    
    init(movieDict: Dictionary<String, AnyObject>) {
        if let title = movieDict["title"] as? String {
            self.title = title
        }
        if let overview = movieDict["overview"] as? String {
            self.overview = overview
        }
        if let path = movieDict["poster_path"] as? String {
            self.posterPath = "\(IMG_URL)\(path)"
        }
    }
    
}
