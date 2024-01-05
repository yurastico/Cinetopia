//
//  MoviesInterectors.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 05/01/24.
//

import Foundation

protocol MoviesPresenterToInteractorProtocol: AnyObject {
    func fetchMovies() async throws -> [Movie]
}

final class MoviesInterector: MoviesPresenterToInteractorProtocol {
    private let movieService = MovieService()
    // forma async, que esta sendo usado
    func fetchMovies() async throws -> [Movie] {
        do {
            let movies = try await movieService.getMovies()
            return movies
           
        } catch (let error ) {
            throw error
        }
    }
    
    

    
}
