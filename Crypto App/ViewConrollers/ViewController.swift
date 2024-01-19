//
//  ViewController.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CryptoCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var viewModel: CryptoViewModel = {
       return CryptoViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupViewModel()
    }
    
    private func setupViewModel() {
        viewModel.fetchCryptoData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCryptoCurrencies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath)
        let crypto = viewModel.crypto(at: indexPath.row)
        cell.textLabel?.text = "\(crypto.name) (\(crypto.symbol)): $\(crypto.quote.USD.price)"
        return cell
    }
}
