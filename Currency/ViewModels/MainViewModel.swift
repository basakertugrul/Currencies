//
//  MainViewModel.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var purchaseIsOpen: Bool = false
    @Published var currencies: [Currency] = [] {
        didSet {
            if currencies != [] {
                self.getHistoryData()
            }
        }
    }
    @Published var addedCurrency: Currency? {
        didSet {
            withAnimation {
                self.purchaseIsOpen = addedCurrency != nil
            }
            transactionAmount = 0
        }
    }
    @Published var currencyValues: [Currency: TRYHistory] = [:]
    @Published var balanceAmount: Double = 0
    @Published var transactionAmount: Double = 0
    @Published var currencyInput: String = "" {
        didSet {
            guard let currency = self.addedCurrency, let currencyValue: Double = self.currencyValues[currency]?.data[Date().getPreviousDateString()]?.dataTRY, let currencyInputAmount =  Double(currencyInput) else { return }
            let totalAmount: Double = currencyValue * currencyInputAmount
            self.totalCost = totalAmount.string
        }
    }
    @Published var totalCost: String = ""
    init() {
        self.getBalanceAmount()
    }
    func getHistoryData() {
        for currency in self.currencies {
            NetworkProvider.shared.getTRYHistory(of: currency.code) { [weak self] result in
                guard let self = self else {return}
                switch result {
                case .success(let tryHistory):
                    DispatchQueue.main.async {
                        self.currencyValues[currency] = tryHistory
                    }
                case .failure(let error):
                    print("Failed to get tryHistoryData: \(error)")
                }
            }
        }
    }
    func openPurchaseScreen(of currency: Currency) {
        self.addedCurrency = currency
    }
    func changeScreenTag() -> Void {
        NotificationCenter.default.post(name: NSNotification.changeScreenTag, object: nil)
    }
    func getBalanceAmount() {
        DispatchQueue.main.async {
            withAnimation {
                self.balanceAmount = self.getBalanceAmountFromRealm()
            }
        }
    }
    func getBalanceAmountFromRealm() -> Double {
        guard let balance = RealmProvider.shared.getBalances() else { return 0 }
        let amount: Double = Array(balance).reduce(0) { $0 + $1.amount }
        return amount
    }
    func addRandomBalance() {
        let amount = Double.random(in: 0...1000)
        let balance = Balance(amount: amount)
        RealmProvider.shared.saveBalance(balance)
        self.getBalanceAmount()
    }
    func addBalance(of amount: Double) {
        let balance = Balance(amount: amount)
        RealmProvider.shared.saveBalance(balance)
        self.getBalanceAmount()
    }
    func addTransaction() {
        guard let currency = self.addedCurrency, let currencyInputAmount = Double(self.currencyInput), let currencyValue: Double = self.currencyValues[currency]?.data[Date().getPreviousDateString()]?.dataTRY else { return }
        let transaction = Transaction(amount: currencyInputAmount, currency: currency, currencyValue: currencyValue)
        RealmProvider.shared.saveTransaction(transaction)
        let amount: Double = currencyValue * currencyInputAmount
        self.addBalance(of: amount)
        self.addedCurrency = nil
    }
}
