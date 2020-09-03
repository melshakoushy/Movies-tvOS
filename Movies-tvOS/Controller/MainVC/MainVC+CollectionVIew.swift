//
//  MainVC+CollectionVIew.swift
//  Movies-tvOS
//
//  Created by Shakoushy on 9/3/20.
//  Copyright © 2020 Elshakoushy. All rights reserved.
//

import Foundation
import UIKit

extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCell, for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        cell.configureCell(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 530)
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if let prev = context.previouslyFocusedView as? MovieCell {
            UIView.animate(withDuration: 0.3) {
                prev.movieImg.frame.size = CGSize(width: 340, height: 530)
            }
        }
        
        if let next = context.nextFocusedView as? MovieCell {
            UIView.animate(withDuration: 0.3) {
                next.movieImg.frame.size = CGSize(width: 374, height: 583)
            }
        }
    }
}
