//
//  ViewController.swift
//  MovieSelector
//
//  Created by Zardasht on 10/15/22.
//

import UIKit

class LibraryViewController: UIViewController  {


    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet weak var dataSource: MovieLibraryDataService!
    
    let movieManager = MovieManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.movieManager = movieManager
        self.libraryTableView.dataSource = dataSource
        self.libraryTableView.delegate = dataSource
        
        
        dataSource.movieManager?.addMovie(movie: Movie(title: "BatMan",relaseDate: "2001"))
        dataSource.movieManager?.addMovie(movie: Movie(title: "SuperMan",relaseDate: "2005"))
        dataSource.movieManager?.addMovie(movie: Movie(title: "Breaking Bad",relaseDate: "2009"))
        dataSource.movieManager?.addMovie(movie: Movie(title: "SpiderMan",relaseDate: "2011"))
        dataSource.movieManager?.addMovie(movie: Movie(title: "Boyka",relaseDate: "2017"))
        
        libraryTableView.reloadData()
        
    }


}

