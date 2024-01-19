//
//  CryptoViewModel.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import Foundation

class CryptoViewModel {
    private var cryptoData: [CryptoData] = []
    
    func fetchCryptoData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("803de14c-2d94-49bb-8696-647668ac97f7", forHTTPHeaderField: "X-CMC_PRO_API_KEY")
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(CryptoDataResponse.self, from: data)
                
                self?.cryptoData = result.data.map { CryptoData(name: $0.name, symbol: $0.symbol, quote: $0.quote) }
                
                completion()
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func numberOfCryptoCurrencies() -> Int {
        return cryptoData.count
    }
    
    func crypto(at index: Int) -> CryptoData {
        return cryptoData[index]
    }
}
