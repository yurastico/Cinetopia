//
//  FavoriteMoviesViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 02/01/24.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {
    
    // MARK: - UIComponents
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 26, bottom: 10, right: 26)
        let collection = UICollectionView(frame: .zero,collectionViewLayout: layout)
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(FavoriteMovieCollectionViewCell.self, forCellWithReuseIdentifier: "FavoriteMovieCollectionViewCell")
        collection.register(FavoriteCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "FavoriteCollectionReusableView")
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    // MARK - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        navigationController?.setNavigationBarHidden(true, animated: true)
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    // MARK - Class Methods

    private func addSubviews() {
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension FavoriteMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteMovieCollectionViewCell", for: indexPath) as? FavoriteMovieCollectionViewCell else { fatalError() }
        
        cell.setupView(Movie(id: 1, title: "teste", image: "a", synopsis: "a mamada reluzente", rate: 5, releaseDate: "ontem"))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:  kind, withReuseIdentifier: "FavoriteCollectionReusableView", for: indexPath) as? FavoriteCollectionReusableView else { fatalError() }
            
            headerView.setupTitle("Meus filmes favoritos")
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
    
}

extension FavoriteMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
}


#Preview {
    FavoriteMoviesViewController()
}
