//
//  ViewController.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let viewModel = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupTableView()
        setupViewModel()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CryptoCell")
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
