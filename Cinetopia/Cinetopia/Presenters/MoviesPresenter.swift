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
}

protocol MoviesPresenterToViewProtocol: AnyObject {
    func didSelect(movie: Movie)
    func didSelectFavoriteButton(_ movie: Movie)
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: [Movie])
    
}

final class MoviesPresenter: MoviesPresenterToViewControllerProtocol {
    //MARK: - MoviesPresenterToViewControllerProtocol
    func viewDidLoad() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    
}

extension MoviesPresenter: MoviesPresenterToViewProtocol {
    func didSelect(movie: Movie) {
        
    }
    
    func didSelectFavoriteButton(_ movie: Movie) {
        <#code#>
    }
    
    func didSearchText(_ searchBar: UISearchBar, textDidChange searchText: String, _ movies: [Movie], _ filteredMovies: [Movie]) {
        <#code#>
    }
    
    
}
