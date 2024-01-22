//
//  DetailedCryptoView.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 22/01/2024.
//

import UIKit

class DetailedCryptoView: UIView {
    
    private let nameLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .headline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let symbolLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageChange1hLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageChange24hLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageChange7dLabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    func configure(with crypto: CryptoData) {
        nameLabel.text = crypto.name
        symbolLabel.text = crypto.symbol
        percentageChange1hLabel.text = "Changed by \(crypto.quote.USD.percent_change_1h.rounded())% in last  1 hour"
        percentageChange24hLabel.text = "Changed by \(crypto.quote.USD.percent_change_24h.rounded())% in last 24 hours"
        percentageChange7dLabel.text = "Changed by \(crypto.quote.USD.percent_change_7d.rounded())% in last 7 days"
    }
    
    private func setupSubviews() {
        addSubview(nameLabel)
        addSubview(symbolLabel)
        addSubview(percentageChange1hLabel)
        addSubview(percentageChange24hLabel)
        addSubview(percentageChange7dLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            symbolLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            symbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            percentageChange1hLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor, constant: 8),
            percentageChange1hLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            percentageChange24hLabel.topAnchor.constraint(equalTo: percentageChange1hLabel.bottomAnchor, constant: 8),
            percentageChange24hLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            percentageChange7dLabel.topAnchor.constraint(equalTo: percentageChange24hLabel.bottomAnchor, constant: 8),
            percentageChange7dLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
