//
//  Currency.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import RealmSwift
import SwiftUI

struct CurrencyData: Codable {
    let data: [String: Currency]
}

class Currency: Object, Codable {
    @Persisted(primaryKey: true) var symbol: String = ""
    @Persisted var name: String = ""
    @Persisted var symbolNative: String = ""
    @Persisted var decimalDigits: Int = -1
    @Persisted var rounding: Int = -1
    @Persisted var code: String = ""
    @Persisted var namePlural: String = ""
    enum CodingKeys: String, CodingKey {
        case symbol, name
        case symbolNative = "symbol_native"
        case decimalDigits = "decimal_digits"
        case rounding, code
        case namePlural = "name_plural"
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.symbolNative = try container.decode(String.self, forKey: .symbolNative)
        self.decimalDigits = try container.decode(Int.self, forKey: .decimalDigits)
        self.rounding = try container.decode(Int.self, forKey: .rounding)
        self.code = try container.decode(String.self, forKey: .code)
        self.namePlural = try container.decode(String.self, forKey: .namePlural)
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(symbol, forKey: .symbol)
        try container.encode(name, forKey: .name)
        try container.encode(symbolNative, forKey: .symbolNative)
        try container.encode(decimalDigits, forKey: .decimalDigits)
        try container.encode(rounding, forKey: .rounding)
        try container.encode(code, forKey: .code)
        try container.encode(namePlural, forKey: .namePlural)
    }
        func getImage() -> Image {
            switch self.code {
            case "GBP":
                return FlagImages.unitedKingdom.image
            case "USD":
                return FlagImages.usa.image
            case "EUR":
                return FlagImages.europe.image
            case "RUB":
                return FlagImages.russia.image
            case "CNY":
                return FlagImages.china.image
            case "TRY":
                return FlagImages.turkey.image
            default:
                return Images.sadFace.image
            }
        }
    func getBuyText() -> String {
        return "Buy \(name)/TL"
    }
}
