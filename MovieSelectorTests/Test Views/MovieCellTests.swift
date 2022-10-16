//
//  MovieCellTests.swift
//  MovieSelectorTests
//
//  Created by Zardasht on 10/16/22.
//

import XCTest
@testable import MovieSelector

final class MovieCellTests: XCTestCase {

    
    var tableView: UITableView!
    var mockDataSource: MockCellDataSource!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController
        _ = libraryVC.view
        tableView = libraryVC.libraryTableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testCell_Config_ShouldSetLabelsToMovieData() {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellID", for: IndexPath(row: 0, section: 0)) as! MovieCell
        cell.configureMovieCell(movie: Movie(title: "Breaking Bad",relaseDate: "2019"))
        
        XCTAssertEqual(cell.textLabel?.text, "Breaking Bad")
        XCTAssertEqual(cell.detailTextLabel?.text, "2019")
    }
    
   
    
    
}
