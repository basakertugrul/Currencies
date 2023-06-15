//
//  Transaction.swift
//  Currency
//
//  Created by Başak Ertuğrul on 15.06.2023.
//

import Foundation
import RealmSwift

class Transaction: Object {
    @Persisted(primaryKey: true)  var id: UUID = UUID()
    @Persisted var amount: Double = 0
    @Persisted var date: Date = Date()
    @Persisted var currency: Currency?
    @Persisted var currencyValue: Double
    convenience init(amount: Double, currency: Currency, currencyValue: Double) {
        self.init()
        self.amount = amount
        self.currency = currency
        self.currencyValue = currencyValue
    }
    func getName() -> String {
        return "\(self.currency?.name ?? "") Exchange"
    }
    func getInfo() -> String {
        return "Exchange Rate: \(currencyValue.liraString)"
    }
    func getDate() -> String {
        return date.getString()
    }
    func getAmountInfo() -> String {
        print(self.currency?.symbol ?? "")
        print(amount.string)
        return "\(self.currency?.symbol ?? "") \(amount.string)"
    }
}
