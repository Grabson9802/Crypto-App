//
//  CryptoTableViewCell.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 21/01/2024.
//

import UIKit

class CryptoCollectionViewCell: UICollectionViewCell {
    static let identifier = "CryptoCollectionViewCell"
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray3
        layer.cornerRadius = 8
        
        setupSubviews()
    }
    
    func configure(with crypto: CryptoData) {
        nameLabel.text = crypto.name
        priceLabel.text = "$\(crypto.quote.USD.price.rounded())"
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
