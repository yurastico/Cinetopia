//
//  MovieDetailViewController.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    var movie: Movie
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.title
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var moviePosterImageView: UIImageView =  {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let url = URL(string: movie.image)
        imageView.kf.setImage(with: url)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 32
        imageView.layer.masksToBounds = true
        
        return imageView
    
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Classificação dos usuários: \(movie.rate)"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var synopsisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movie.synopsis
        label.numberOfLines = 0
        label.textColor = .white
        //label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    
    
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
       
        
        
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(moviePosterImageView)
        view.addSubview(ratingLabel)
        view.addSubview(synopsisLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            moviePosterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 192.0),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 264.0),
            moviePosterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
            
            ratingLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 32),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            synopsisLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 32),
            synopsisLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            synopsisLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16)
            
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .background
        addSubviews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}




/* -- abordagem da Giovanna
 class MovieDetailsViewController: UIViewController {
     
     private var movie: Movie
     
     private lazy var titleLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = movie.title
         label.textAlignment = .center
         label.numberOfLines = 0
         label.textColor = .white
         label.font = .systemFont(ofSize: 28.0, weight: .bold)
         return label
     }()
     
     private lazy var posterImageView: UIImageView = {
         let imgView = UIImageView(image: UIImage(named: movie.image))
         imgView.translatesAutoresizingMaskIntoConstraints = false
         imgView.layer.cornerRadius = 32.0
         imgView.layer.masksToBounds = true
         return imgView
     }()
     
     private lazy var userRatingLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Classificação dos usuários: \(movie.rate)"
         label.numberOfLines = 0
         label.textColor = .white
         label.font = .systemFont(ofSize: 16.0, weight: .bold)
         return label
     }()
     
     private lazy var synopsisLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 0
         label.textColor = .white.withAlphaComponent(0.75)
         label.text = movie.synopsis
         return label
     }()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = .background
         addSubviews()
         setupConstraints()
         // Do any additional setup after loading the view.
     }
     
     private func addSubviews() {
         view.addSubview(titleLabel)
         view.addSubview(posterImageView)
         view.addSubview(userRatingLabel)
         view.addSubview(synopsisLabel)
     }
     
     private func setupConstraints() {
         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
             titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
             
             userRatingLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 32.0),
             userRatingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
             posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             posterImageView.widthAnchor.constraint(equalToConstant: 192.0),
             posterImageView.heightAnchor.constraint(equalToConstant: 264.0),
             posterImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32.0),
             
             synopsisLabel.topAnchor.constraint(equalTo: userRatingLabel.bottomAnchor, constant: 32.0),
             synopsisLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
             synopsisLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
         ])
     }
     
     init(movie: Movie) {
         self.movie = movie
         super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
     
 }
 
 */
