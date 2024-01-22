//
//  DetailedCryptoViewController.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 21/01/2024.
//

import UIKit

class DetailedCryptoViewController: UIViewController {
    
    private lazy var detailedCryptoView = {
        let detailedCryptoView = DetailedCryptoView(frame: .zero)
        detailedCryptoView.translatesAutoresizingMaskIntoConstraints = false
        return detailedCryptoView
    }()
    
    private let selectedCrypto: CryptoData
    
    init(selectedCrypto: CryptoData) {
        self.selectedCrypto = selectedCrypto
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondarySystemBackground
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(detailedCryptoView)
        
        NSLayoutConstraint.activate([
            detailedCryptoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailedCryptoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailedCryptoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedCryptoView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        detailedCryptoView.configure(with: selectedCrypto)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
