//
//  MovieLibraryDataService.swift
//  MovieSelector
//
//  Created by Zardasht on 10/16/22.
//

import UIKit

enum LibrarySections: Int  {
    case movieToSee , movieSeen
}

class MovieLibraryDataService: NSObject , UITableViewDataSource , UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0 }
        guard let librarySections = LibrarySections(rawValue: section) else {  fatalError() }

        switch librarySections {

        case .movieToSee:
            return movieManager.movieToSeeCount

        case .movieSeen:
            return movieManager.movieSeenCount
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySections(rawValue: indexPath.section) else { fatalError() }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellID", for: indexPath) as! MovieCell
        
        let movieData = librarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        
        cell.configureMovieCell(movie: movieData)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySections(rawValue: indexPath.section) else { fatalError()  }
        
        if librarySection == .movieToSee {
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //guard let movieManager = movieManager else { fatalError() }
        guard let librarySection = LibrarySections(rawValue: section) else { fatalError() }
        
        let movieData = librarySection.rawValue == 0 ? "Movie To See" : "Movie Seen"
        return movieData
    }
    

    
    
}
