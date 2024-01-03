//
//  FavoriteCollectionReusableView.swift
//  Cinetopia
//
//  Created by Yuri Cunha on 03/01/24.
//

import UIKit

class FavoriteCollectionReusableView: UICollectionReusableView {
    // MARK: - UIComponents
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 28.0, weight: .medium)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        addSubview(headerLabel)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupTitle(_ title: String) {
        headerLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
