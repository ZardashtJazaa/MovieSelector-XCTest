//
//  MovieLibraryDataServiceTest.swift
//  MovieSelectorTests
//
//  Created by Zardasht on 10/16/22.
//

import XCTest
@testable import MovieSelector

final class MovieLibraryDataServiceTest: XCTestCase {
    
    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    var libraryVC: LibraryViewController!
    var tableViewMock: TableViewMock!
    
    let Taken = Movie(title: "Taken")
    let Boyka = Movie(title: "Boyka")
    let IronMan = Movie(title: "IronMan")
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        
        tableViewMock = TableViewMock.initMock(dataSource: sut)
        
        libraryVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewControllerID") as! LibraryViewController)
        _ = libraryVC.view
        
        libraryTableView = libraryVC.libraryTableView
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Sections
    func testTableViewSections_CountsReturnsTwo() {
        
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnMoviesToSeeCount() {
        
//        sut.movieManager?.addMovie(movie: Taken)
//        sut.movieManager?.addMovie(movie: Boyka)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
//
//        sut.movieManager?.addMovie(movie: IronMan)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 5)
        
    }
    
    func testTableViewSections_SectionTwo_ReturnMoviesSeenCount() {
        
//        sut.movieManager?.addMovie(movie: Taken)
//        sut.movieManager?.addMovie(movie: IronMan)
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//
//        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
//
//        sut.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 0)
    }
    
    //MARK: - Cell
    
    func testCell_RowAtIndex_ReturnsMovieCell() {
        sut.movieManager?.addMovie(movie: Taken)
        libraryTableView.reloadData()
        
        let cellQueried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQueried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell() {
       
        sut.movieManager?.addMovie(movie: Boyka)
        tableViewMock.reloadData()
        _ = tableViewMock.cellForRow(at: IndexPath(item: 0, section: 0))
        
        XCTAssertTrue(tableViewMock.cellDequeuedPropelry)
    }
    
    func testCell_SectionOneConfig_ShouldSetCellData()  {
        
        sut.movieManager?.addMovie(movie: Taken)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(item: 0, section: 0)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, Taken)
    }
    
    func testCell_SectionTwoConfig_ShouldSetCellData()  {
        sut.movieManager?.addMovie(movie: Boyka)
        sut.movieManager?.addMovie(movie: IronMan)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        XCTAssertEqual(cell.movieData, Boyka)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie() {
        
        sut.movieManager?.addMovie(movie: Taken)
        sut.movieManager?.addMovie(movie: Boyka)
        libraryTableView.delegate?.tableView?(libraryTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(sut.movieManager?.movieToSeeCount, 1)
        XCTAssertEqual(sut.movieManager?.movieSeenCount, 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
       
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValue()  {
        let section1Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 0)
        let section2Title = libraryTableView.dataSource?.tableView?(libraryTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(section1Title, "Movie To See")
        XCTAssertEqual(section2Title, "Movie Seen")
        
    }
    
    
}

