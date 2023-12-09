//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var movieTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    func configureCell(movie: Movie) {
        movieTitlelabel.text = movie.title
        let url = URL(string: movie.image)
        moviePosterImageView.kf.setImage(with: url)
        
        movieReleaseDate.text = "Lançamento: \(movie.releaseDate)"
    }

    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitlelabel)
        addSubview(movieReleaseDate)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -16),
            movieTitlelabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor,constant: 16),
            movieTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            movieReleaseDate.topAnchor.constraint(equalTo: movieTitlelabel.bottomAnchor, constant: 8),
            movieReleaseDate.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor,constant: 16)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        backgroundColor = .background
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

#Preview {
    MovieTableViewCell()
}
