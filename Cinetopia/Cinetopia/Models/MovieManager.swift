//
//  MovieManager.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 03/01/24.
//

import Foundation

class MovieManager {
    static let shared = MovieManager()
    var favoriteMovies: [Movie] = []
    
    private init() {
        
    }
    func add(_ movie: Movie) {
        if favoriteMovies.contains(where: { $0.id == movie.id}) {
            remove(movie)
            return
        }
        favoriteMovies.append(movie)
    }
     
    private func remove(_ movie: Movie) {
        if let index = favoriteMovies.firstIndex(where: {$0.id == movie.id}) {
            favoriteMovies.remove(at: index)
        }
    }
    
}
