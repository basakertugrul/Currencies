//
//  Balance.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import RealmSwift

class Balance: Object {
    @Persisted(primaryKey: true)  var id: UUID = UUID()
    @Persisted var amount: Double = 0
    convenience init(amount: Double) {
        self.init()
        self.amount = amount
    }
}
