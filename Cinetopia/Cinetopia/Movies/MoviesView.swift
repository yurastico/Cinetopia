//
//  MoviesView.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 04/01/24.
//

import UIKit

protocol MoviesViewProtocol: AnyObject {
    func setupView(with movies: [Movie])
    func reloadData()
    func navigateToMoviesDetail(movie: Movie)
    func reloadRow(at indexPath: IndexPath)
    func toggle(_ isActive: Bool)
}

class MoviesView: UIView {

    //MARK: - Attributes
    private var filteredMovies: [Movie] = []
    private var isSearchActive = false
    var movies: [Movie] = []
    private var presenter: MoviesPresenterToViewProtocol?
    
    
    //MARK: - UIComponents
    
    private(set) lazy var searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.placeholder = "Pesquisar."
        bar.searchTextField.backgroundColor = .white
        //bar.delegate = self
        return bar
    }()
    
    
    private lazy var tableView: UITableView  = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
        return tableView
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .background
        addSubviews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Class methods
    private func addSubviews() {
        addSubview(tableView)
    }
    private func setupContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        
    }
    
 

}

extension MoviesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearchActive ? filteredMovies.count : movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { fatalError() }
        
        //cell.textLabel?.text = names[indexPath.row] -- vai ser depreciado
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        cell.configureCell(movie: movie)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
}

extension MoviesView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let movie = isSearchActive ? filteredMovies[indexPath.row] : movies[indexPath.row]
        let movieDetailViewController = MovieDetailViewController(movie: movie)
        //navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
}

extension MoviesView: MovieTableViewCellDelegate {
    func didSelectFavoriteButton(sender: UIButton) {
        guard let cell = sender.superview?.superview as? MovieTableViewCell else { return }
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let selectedMovie = movies[indexPath.row]
        selectedMovie.changeSelectionStatus()
        MovieManager.shared.add(selectedMovie)
        
        //tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
        
    }
    
    
}

extension MoviesView: MoviesViewProtocol {
    func setupView(with movies: [Movie]) {
        self.movies = movies
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func navigateToMoviesDetail(movie: Movie) {
        
    }
    
    func reloadRow(at indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func toggle(_ isActive: Bool) {
        self.isSearchActive = isActive
    }
    
    
}
