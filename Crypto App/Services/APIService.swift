//
//  APIService.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    func fetchCryptoData(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest") else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        guard let apiKey = APIKeyManager.shared.getAPIKey() else {
            return
        }

        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }

            completion(.success(data))
        }.resume()
    }
}

enum APIError: Error {
    case invalidURL
    case noData
}
