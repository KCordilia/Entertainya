//
//  HomeDataSource.swift
//  Entertainya
//
//  Created by Karim Cordilia on 02/02/2021.
//  Copyright © 2021 Karim Cordilia. All rights reserved.
//

import UIKit

class HomeDataSource: NSObject, UITableViewDataSource {
    var items: [Movie] = []
    
    func set(items: [Movie]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: R.reuseIdentifier.movieTableViewCell,
                for: indexPath)
        else {
            assertionFailure("MovieTableViewCell not initialized")
            return .init()
        }
        cell.configure(movie: items[indexPath.row])
        return cell
    }
    
    
}
