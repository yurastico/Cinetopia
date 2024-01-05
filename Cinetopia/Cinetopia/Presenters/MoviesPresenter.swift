//
//  MoviesPresenter.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 04/01/24.
//

import UIKit

protocol MoviesPresenterToViewControllerProtocol: AnyObject {
    func viewDidLoad()
    func viewDidAppear()
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol)
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(movie: Movie)
    func didSelectFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie])
    
}

final class MoviesPresenter: MoviesPresenterToViewControllerProtocol {
    
    private var controller: MoviesViewControllerToPresenterProtocol?
    private var view: MoviesViewProtocol?
    private let movieService = MovieService()
    
    
    func setViewController(_ viewController: MoviesViewControllerToPresenterProtocol) {
            self.controller = viewController
        }


    
    init(view: MoviesViewProtocol) {
        self.view = view
    }
    
    //MARK: - MoviesPresenterToViewControllerProtocol
    func viewDidLoad() {
        view?.setPresenter(self)
        Task {
            await fetchMovies()
        }
    }
    
    func viewDidAppear() {
        view?.reloadData()
    }
    
    
    //MARK: - Class Methods
    //forma async (eh a que esta sendo usada)
    private func fetchMovies() async {
        do {
            let movies = try await movieService.getMovies()
            view?.setupView(with: movies)
           view?.reloadData()
        } catch (let error ) {
            print(error)
        }
    }
    //forma com completion, (nao esta sendo usado)
    private func fetchMovies() {
        movieService.getMovies() { result in
            
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    //self.movies = movies
                    self.view?.setupView(with: movies)
                    self.view?.reloadData()
                }
            case .failure(let error):
                print(error)
            }
          
            
           
            
        }
    }
}

extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(movie: Movie) {
        controller?.didSelectMovie(movie)
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        movie.changeSelectionStatus()
        MovieManager.shared.add(movie)
    }
    
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: inout [Movie]) {
        if searchText.isEmpty {
            view?.toggle(false)
        } else {
            view?.toggle(true)
            filteredMovies = movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
}
