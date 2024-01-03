//
//  TabBarController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 03/01/24.
//

import UIKit

class TabBarController: UITabBarController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarController()
        self.navigationItem.setHidesBackButton(true, animated: true)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Class Methods
    private func setUpTabBarController() {
        let home = UINavigationController(rootViewController: MoviesViewController())
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .medium)
        let homeSymbol = UIImage(systemName: "film",withConfiguration: symbolConfiguration)
        home.tabBarItem.image = homeSymbol
        home.tabBarItem.title = "Filmes populares"
        
        let favorites = UINavigationController(rootViewController: FavoriteMoviesViewController())
        let favoriteSymbol = UIImage(systemName: "heart",withConfiguration: symbolConfiguration)
        favorites.tabBarItem.image = favoriteSymbol
        favorites.tabBarItem.title = "Favoritos"
        
        self.setViewControllers([home,favorites], animated: true)
        
        
    }

   

}
