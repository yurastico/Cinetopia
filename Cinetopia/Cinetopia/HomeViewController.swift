//
//  ViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var coupleImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.couple)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "O lugar ideal para buscar,salvar e organizar seus filmes favoritos!"
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20,weight: .bold)
        
        return label
    }()

    private lazy var welcomeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Quero comecar", for: .normal)
        button.backgroundColor = .buttonBackground
        button.setTitleColor(.background, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 32
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
        
       
    }
    
    

    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(coupleImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(welcomeButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 64),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            coupleImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 32),
            coupleImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            welcomeLabel.topAnchor.constraint(equalTo: coupleImageView.bottomAnchor,constant: 32),
            
            //welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor) -- ela so centraliza, se a view for maior que o tamalho do da tela ela nao eh exibida por completo
            
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
            welcomeButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 32),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 64),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 64)
        ])
    }

}

