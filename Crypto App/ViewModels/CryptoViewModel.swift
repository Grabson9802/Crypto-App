//
//  CryptoViewModel.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import Foundation

class CryptoViewModel {
    
    weak var delegate: CryptoCollectionViewModelDelegate?
    
    private let apiService = APIService.shared
    
    private var cryptoData: [CryptoData] = [] {
        didSet {
            delegate?.didUpdateCryptos()
        }
    }
    
    var numberOfCryptos: Int {
        return cryptoData.count
    }
    
    func fetchCryptoData(completion: @escaping () -> Void) {
        apiService.fetchCryptoData{ [weak self] result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(CryptoDataResponse.self, from: data)
                    self?.cryptoData = result.data.map { CryptoData(name: $0.name, symbol: $0.symbol, quote: $0.quote) }
                    completion()
                } catch {
                    print("Error decoding JSON: \(error)")
                }
                
            case .failure(let error):
                print("API request error: \(error.localizedDescription)")
            }
        }
    }
    
    func crypto(at index: Int) -> CryptoData? {
        guard index >= 0, index < cryptoData.count else {
            return nil
        }
        return cryptoData[index]
    }
}
