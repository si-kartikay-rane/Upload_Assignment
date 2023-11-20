//
//  MovieManager.swift
//  MoviesAPI
//
//  Created by Kartikay Rane on 26/10/23.
//

import Foundation
import UIKit

struct MovieManager{
    func fetchMovies(completion: @escaping(MovieModel) -> Void){
        guard let url = URL(string: "https://reactnative.dev/movies.json")
        else{return}
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Print Error fetching movies: \(error.localizedDescription)")
            }
            guard let jsonData = data else {return}
            let decoder = JSONDecoder()
            
            do{
                let decodeData = try decoder.decode(MovieModel.self, from: jsonData)
                completion(decodeData)
            }catch{
                print("Error decoding data")
            }
        }
        dataTask.resume()
    }
}
