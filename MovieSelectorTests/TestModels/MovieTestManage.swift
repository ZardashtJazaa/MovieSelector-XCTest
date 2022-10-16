//
//  MovieTestManage.swift
//  MovieSelectorTests
//
//  Created by Zardasht on 10/15/22.
//

import XCTest
@testable import MovieSelector

final class MovieTestManage: XCTestCase {

     //MARK: - Properety
    
    var sut: MovieManager!
    let batman = Movie(title: "BatMan")
    let superMan = Movie(title: "SuperMan")
    let breakingBad = Movie(title: "BrekingBad")
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testInit_MovieToSee_ReturnZero() {
        XCTAssertEqual(sut.movieToSeeCount, 0)
        
    }
    
    func tetsInit_MovieSeen_ReturnZero() {
        XCTAssertEqual(sut.movieSeenCount, 0)
    }
    //MARK: - Add & Query
    func testAdd_MovieToSee_ReturnOne() {
        
        sut.addMovie(movie:batman)
        XCTAssertEqual(sut.movieToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex() {
        
        sut.addMovie(movie: superMan)
        let moviedQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(superMan.title, moviedQueried.title)
    }
    
    //MARK: - CheckingOff
    
    func testCheckOffMovie_UpdateMovieManagerCounts() {
        sut.addMovie(movie:breakingBad)
        sut.checkOffMovieAtIndex(index:0)
        
        XCTAssertEqual(sut.movieToSeeCount, 0)
        XCTAssertEqual(sut.movieSeenCount, 1)
        
        
    }
    
    func testCheckOffMovie_RemovesMovieFromArray() {
        sut.addMovie(movie: breakingBad)
        sut.addMovie(movie: superMan)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, superMan.title)
    }
    
    func testCheckedOffMovie_ReturnsMovieAtIndex() {
        
        sut.addMovie(movie: batman)
        sut.checkOffMovieAtIndex(index: 0)
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(batman.title, movieQueried.title)
    }
    
    //MARK: - Clearing & Restting
    func testClearArray_ReturnArrayCountOfZero() {
        
        sut.addMovie(movie: batman)
        sut.addMovie(movie: breakingBad)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieToSeeCount, 1)
        XCTAssertEqual(sut.movieSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.movieToSeeCount, 0)
        XCTAssertEqual(sut.movieSeenCount, 0)
    }
    
    //MARK: - Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray() {
        
        sut.addMovie(movie: batman)
        sut.addMovie(movie: batman)
        
        XCTAssertEqual(sut.movieToSeeCount, 1)
    }
    
}
