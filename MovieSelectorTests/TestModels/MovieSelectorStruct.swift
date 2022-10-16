//
//  MovieSelectorStruct.swift
//  MovieSelectorTests
//
//  Created by Zardasht on 10/15/22.
//

import XCTest
@testable import MovieSelector
final class MovieSelectorStruct: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - Initializations
    func testInit_MovieWithTitle()  {
        
        let testMovie = Movie(title: "Harry Potter")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title , "Harry Potter")
    }

    
    func testInit_MovieWithTitleAndRelaseDate() {
        
        let testMovie = Movie(title: "Spider Man", relaseDate: "2005")
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.relaseDate, "2005")
        
    }
    
    //MARK: - Equatable
    func testEquatable_ReturnTrue() {
        let actionMovie1 = Movie(title: "Batman")
        let actionMovie2 = Movie(title: "Batman")
        
        XCTAssertEqual(actionMovie1, actionMovie2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles()  {
        let actionMovie1 = Movie(title: "Batman")
        let actionMovie2 = Movie(title: "SuperMan")
        
        XCTAssertNotEqual(actionMovie1, actionMovie2)
        
    }
    
    func testEquatable_ReturnsNotEqualForDifferentRelaseDates() {
        let actionMovie1 = Movie(title: "Action",relaseDate: "1999")
        let actionMovie2 = Movie(title: "Action",relaseDate: "2000")
        XCTAssertNotEqual(actionMovie1, actionMovie2)
        
    }
    
}
