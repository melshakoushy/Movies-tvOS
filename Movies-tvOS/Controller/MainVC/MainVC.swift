//
//  ViewController.swift
//  Movies-tvOS
//
//  Created by Shakoushy on 9/3/20.
//  Copyright © 2020 Elshakoushy. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    
    // MARK: Constants
    let movieCell = "MovieCell"
    
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
        
    }
}

