//
//  Mocks+Extentions.swift
//  MovieSelectorTests
//
//  Created by Zardasht on 10/16/22.
//

import UIKit
@testable import MovieSelector

extension MovieLibraryDataServiceTest {
    
    class TableViewMock: UITableView {
       
        var cellDequeuedPropelry = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            
            let mock = TableViewMock.init(frame: CGRect(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "MovieCellID")
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            
            cellDequeuedPropelry = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        
        var movieData: Movie?
        
        override func configureMovieCell(movie:Movie) {
            movieData = movie
        }
    }
    
}


extension MovieCellTests {
    
    class MockCellDataSource: NSObject , UITableViewDataSource  {
      
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            return UITableViewCell()
            
        }
        
        
    }
}

