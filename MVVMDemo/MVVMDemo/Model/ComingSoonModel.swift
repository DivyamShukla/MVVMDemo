//
//  ComingSoonModel.swift
//  MVVMDemo
//
//  Created by Divyam on 08/06/21.
//

import Foundation

// MARK: - Results
struct Results {
    
    let results: [Result]
    init(resultArray:[Result]) {
        
        self.results = resultArray
    }
    
}


// MARK: - Result
struct Result {
    let artistName:String
    let  name: String
    let genres: [Genre]
    let url: String

    init(name: String,title: String, image_url: String, genre: [Genre]) {
            self.artistName = name
            self.name = title
            self.url = image_url
            self.genres = genre
        }
}

// MARK: - Genre
struct Genre {
    let name: String
    let url: String

    init(name: String, image_url: String) {
            self.name = name
            self.url = image_url
        }
}


