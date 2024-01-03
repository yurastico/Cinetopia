//
//  FavoriteMovieViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 02/01/24.
//

import UIKit

class FavoriteMovieViewController: UIViewController {

    // MARK: - UIComponents
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Class Methods

    private func addSubviews() {
        view.addSubview(mainView)
    }
    private func setupConstraints() {
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor,constant: 100).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mainView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        
        
    }
}

#Preview {
    FavoriteMovieViewController()
}
