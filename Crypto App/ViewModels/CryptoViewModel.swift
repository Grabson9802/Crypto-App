//
//  CryptoViewModel.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import Foundation

class CryptoViewModel {
    private var cryptoData: [CryptoData] = []
    private let apiService = APIService.shared
    
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
    
    func numberOfCryptoCurrencies() -> Int {
        return cryptoData.count
    }
    
    func crypto(at index: Int) -> CryptoData {
        return cryptoData[index]
    }
}
