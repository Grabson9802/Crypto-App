//
//  CryptoModel.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 19/01/2024.
//

struct CryptoDataResponse: Codable {
    let data: [CryptoData]
}

struct CryptoData: Codable {
    let name: String
    let symbol: String
    let quote: Quote
}

struct Quote: Codable {
    let USD: Price
}

struct Price: Codable {
    let price: Double
    let percent_change_1h: Double
    let percent_change_24h: Double
    let percent_change_7d: Double
}
