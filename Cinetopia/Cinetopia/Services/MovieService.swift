//
//  MovieService.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 08/12/23.
//

import Foundation

enum MovieServiceError: Error {
    case invalidUrl
    case invalidResponse
    case decodingError
}
struct MovieService {
   
    func getMovies(completion: @escaping (Result<[Movie],MovieServiceError>) -> Void) {
        
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {  completion(.failure(.invalidUrl))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                      return
                  }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch (let error){
                print(error)
                completion(.failure(.decodingError))
            }

           
        }
        
        task.resume()
       
    }
}
