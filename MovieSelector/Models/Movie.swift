//
//  Movie.swift
//  MovieSelector
//
//  Created by Zardasht on 10/15/22.
//

import Foundation

struct Movie: Equatable {
    
    let title: String
    let relaseDate: String?
    
    init(title: String, relaseDate: String? = nil) {
        self.title = title
        self.relaseDate = relaseDate
    }
}

func==(lhs:Movie , rhs:Movie) -> Bool {
    
    if lhs.title != rhs.title {
        return false
    }
    
    if lhs.relaseDate != rhs.relaseDate {
        return false
    }
    
    return true
}
