//
//  MovieService.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 08/12/23.
//

import Foundation

struct MovieService {
    func getMovies() {
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      return
                  }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                print(movies)
            } catch (let error){
                print(error)
            }
            
           
            
            
        }
        
        task.resume()
    }
}
