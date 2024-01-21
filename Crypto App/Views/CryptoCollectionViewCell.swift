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
        return label
    }()
    
    private let priceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray
        layer.cornerRadius = 10
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with crypto: CryptoData) {
        nameLabel.text = crypto.name
        priceLabel.text = "$\(crypto.quote.USD.price.rounded())"
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
}
