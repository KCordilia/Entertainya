//
//  HomeDataSource.swift
//  Entertainya
//
//  Created by Karim Cordilia on 02/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UICollectionViewDataSource {
    
    var nowPlayingMovies: [Movie] = []
    var upcomingMovies: [Movie] = []
    var popularMovies: [Movie] = []
    var topRatedMovies: [Movie] = []
    
    func set(nowPlayingMovies: [Movie]) {
        self.nowPlayingMovies = nowPlayingMovies
    }
    
    
    func set(upcomingMovies: [Movie]) {
        self.upcomingMovies = upcomingMovies
    }
    
    func set(popularMovies: [Movie]) {
        self.popularMovies = popularMovies
    }
    
    func set(topRatedMovies: [Movie]) {
        self.topRatedMovies = topRatedMovies
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return nowPlayingMovies.count
        case 1:
            return upcomingMovies.count
        case 2:
            return popularMovies.count
        default:
            return topRatedMovies.count
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
            cell.configure(movie: nowPlayingMovies[indexPath.row], isPoster: true)
        case 1:
            cell.configure(movie: upcomingMovies[indexPath.row], isPoster: false)
        case 2:
            cell.configure(movie: popularMovies[indexPath.row], isPoster: false)
        default:
            cell.configure(movie: topRatedMovies[indexPath.row], isPoster: false)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: R.nib.sectionTitleView.identifier, withReuseIdentifier: R.reuseIdentifier.sectionTitleView, for: indexPath)
        switch indexPath.section {
        case 0:
            header?.set(title: "Now Playing")
        case 1:
            header?.set(title: "Upcoming")
        case 2:
            header?.set(title: "Popular")
        default:
            header?.set(title: "Top Rated")
        }
        return header!
    }
    
}
