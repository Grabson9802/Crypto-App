//
//  Double+Extensions.swift
//  Crypto App
//
//  Created by Krystian Grabowy on 21/01/2024.
//

import Foundation

extension Double {
    func rounded() -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        let formattedString = formatter.string(from: NSNumber(value: self)) ?? "\(self)"
        
        return formattedString
    }
}
