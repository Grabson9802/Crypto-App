//
//  ApiKeyManager.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

import Foundation

class APIKeyManager {
    static let shared = APIKeyManager()

    private var apiKey: String?

    private init() {
        loadCoinMarketCapAPIKey()
    }

    private func loadCoinMarketCapAPIKey() {
        guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
              let configDictionary = NSDictionary(contentsOfFile: path),
              let apiKey = configDictionary["ApiKey"] as? String
        else {
            print("Error: Unable to load API key from Config.plist")
            return
        }

        self.apiKey = apiKey
    }

    func getAPIKey() -> String? {
        return apiKey
    }
}
