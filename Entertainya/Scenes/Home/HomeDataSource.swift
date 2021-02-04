//
//  HomeDataSource.swift
//  Entertainya
//
//  Created by Karim Cordilia on 02/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    var popularMovies: [Movie] = []
    var nowPlayingMovies: [Movie] = []
    var topRatedMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    
    func set(popularMovies: [Movie]) {
        self.popularMovies = popularMovies
    }
    
    func set(nowPlayingMovies: [Movie]) {
        self.nowPlayingMovies = nowPlayingMovies
    }
    
    func set(topRatedMovies: [Movie]) {
        self.topRatedMovies = topRatedMovies
    }
    
    func set(upcomingMovies: [Movie]) {
        self.upcomingMovies = upcomingMovies
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return popularMovies.count
        case 1:
            return nowPlayingMovies.count
        case 2:
            return topRatedMovies.count
        default:
            return upcomingMovies.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: R.reuseIdentifier.movieCollectionViewCell,
                for: indexPath)
        else {
            assertionFailure("MovieCollectionViewCell not initialized")
            return .init()
        }
        switch indexPath.section {
        case 0:
            cell.configure(movie: popularMovies[indexPath.row])
        case 1:
            cell.configure(movie: nowPlayingMovies[indexPath.row])
        case 2:
            cell.configure(movie: topRatedMovies[indexPath.row])
        default:
            cell.configure(movie: upcomingMovies[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: R.nib.sectionTitleView.identifier, withReuseIdentifier: R.reuseIdentifier.sectionTitleView, for: indexPath)
        switch indexPath.section {
        case 0:
            header?.set(title: "Popular")
        case 1:
            header?.set(title: "Now Playing")
        case 2:
            header?.set(title: "Top Rated")
        default:
            header?.set(title: "Upcoming")
        }
        return header!
    }
    
}
