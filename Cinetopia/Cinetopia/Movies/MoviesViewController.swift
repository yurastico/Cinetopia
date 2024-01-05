//
//  MoviesViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit

protocol MoviesViewControllerToPresenterProtocol: AnyObject {
    func didSelectMovie(_ movie: Movie)
}

class MoviesViewController: UIViewController {

    private var presenter: MoviesPresenterToViewControllerProtocol?
    
    private var mainView: MoviesView?
    
    init(view: MoviesView, presenter: MoviesPresenterToViewControllerProtocol) {
        super.init(nibName: "", bundle: nil)
        self.presenter = presenter
        self.mainView = view    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setViewController(self)
        
        presenter?.viewDidLoad()
        setupNavigationBar()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.viewDidAppear()
    }
    
   
    
    private func setupNavigationBar() {
        title = "Filmes Populares"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.titleView = mainView?.searchBar
    }
    
}

extension MoviesViewController: MoviesViewControllerToPresenterProtocol {
    func didSelectMovie(_ movie: Movie) {
        let detailsVielController = MovieDetailViewController(movie: movie)
        navigationController?.pushViewController(detailsVielController, animated: true)
    }
}




