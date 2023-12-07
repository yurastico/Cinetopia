//
//  MovieTableViewCell.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 07/12/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    private lazy var moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .avatar
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    private lazy var movieTitlelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "avatar"
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var movieReleaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lançamento: diadosexo"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()

    private func addSubviews() {
        addSubview(moviePosterImageView)
        addSubview(movieTitlelabel)
        addSubview(movieReleaseDate)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            moviePosterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            moviePosterImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            moviePosterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            
            movieTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieTitlelabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor,constant: 16),
            
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
