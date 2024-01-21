//
//  ViewController.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import UIKit

class RootViewController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CryptoCollectionViewCell.self, forCellWithReuseIdentifier: CryptoCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    private lazy var viewModel: CryptoViewModel = {
       return CryptoViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Crypto App"
        
        setupSubviews()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.fetchCryptoData { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.bounds.width - 40
        let cellHeight: CGFloat = 50
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfCryptos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CryptoCollectionViewCell.identifier, for: indexPath) as? CryptoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let crypto = viewModel.crypto(at: indexPath.item) {
            cell.configure(with: crypto)
        }
        
        return cell
    }
}

extension RootViewController: CryptoCollectionViewModelDelegate {
    func didUpdateCryptos() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}
