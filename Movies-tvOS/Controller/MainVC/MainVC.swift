//
//  ViewController.swift
//  Movies-tvOS
//
//  Created by Shakoushy on 9/3/20.
//  Copyright © 2020 Elshakoushy. All rights reserved.
//

import UIKit
import Foundation

class MainVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    // MARK: Constants
    let movieCell = "MovieCell"
    
    //MARK: Variables
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        downloadData()
    }
    
    func setupCollectionView() {
        self.moviesCollectionView.delegate = self
        self.moviesCollectionView.dataSource = self
        self.moviesCollectionView.register(UINib(nibName: movieCell, bundle: nil), forCellWithReuseIdentifier: movieCell)
    }
    
    func downloadData() {
        let url = URL(string: BASE_URL)!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
            } else {
                do {
                    let dict = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? Dictionary<String, AnyObject>
                    if let results = dict!["results"] as? [Dictionary<String, AnyObject>] {
                        for obj in results {
                            let movie = Movie(movieDict: obj)
                            self.movies.append(movie)
                        }
                        DispatchQueue.global(qos: .background).async {
                            DispatchQueue.main.async {
                                self.moviesCollectionView.reloadData()
                            }
                        }
                    }
                } catch {
                    
                }
            }
        }
        task.resume()
    }
}

