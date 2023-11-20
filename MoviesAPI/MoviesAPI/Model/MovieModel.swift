//
//  MovieModel.swift
//  MoviesAPI
//
//  Created by Kartikay Rane on 26/10/23.
//

import Foundation

struct MovieModel: Codable{
    let title: String
    let description: String
    let movies: [Movies]
}

struct Movies : Codable{
    let id: String
    let title: String
    let releaseYear: String
}
