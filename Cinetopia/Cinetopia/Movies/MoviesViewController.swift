//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit



class MoviesViewController: UIViewController {
    

    private let movieService = MovieService()
    private lazy var mainView: MoviesView = {
        let view = MoviesView()
        return view
    }()
    
    override func loadView() {
        view = mainView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        Task {
            await fetchMovies()
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    //forma async (eh a que esta sendo usada)
    private func fetchMovies() async {
        do {
            let movies = try await movieService.getMovies()
            tableView.reloadData()
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
                    self.movies = movies
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
          
            
           
            
        }
    }
    
    private func setupNavigationBar() {
        title = "Filmes Populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = mainView.searchBar
    }
    
    
    
     
     

}



//extension MoviesViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText.isEmpty {
//            isSearchActive = false
//        } else {
//            isSearchActive = true
//            filteredMovies = movies.filter { $0.title.lowercased().contains(searchText.lowercased()) }
//        }
//        tableView.reloadData()
//    }
//}
//
