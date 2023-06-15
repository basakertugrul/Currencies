//
//  PastOperationsViewModel.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import SwiftUI

class PastOperationsViewModel: ObservableObject {
    @Published var transactions: [Transaction] = []
    init() {
        self.getPastOperations()
    }
    func getPastOperations() {
        DispatchQueue.main.async {
            withAnimation {
                self.transactions = self.getPastOperationsFromRealm()
            }
        }
    }
    func getPastOperationsFromRealm() -> [Transaction] {
        guard let transactions = RealmProvider.shared.getTransactions() else { return []}
        return Array(transactions)
    }
}

