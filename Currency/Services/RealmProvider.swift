//
//  RealmProvider.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import Foundation
import RealmSwift

class RealmProvider {
    private var realm: Realm
    static let shared = RealmProvider()
    private init() {
            do {
                self.realm = try Realm()
            } catch {
                fatalError("Failed to initialize Realm: \(error)")
            }
    }
    func deleteRealmFile() {
        let fileManager = FileManager.default
        if let realmURL = Realm.Configuration.defaultConfiguration.fileURL {
            Realm.Configuration.defaultConfiguration = Realm.Configuration()
            do {
                try fileManager.removeItem(at: realmURL)
            } catch {
                fatalError("Failed to delete Realm: \(error)")
            }
        }
    }
    func saveCurrencies(_ currencies: [Currency]) {
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.add(currencies, update: .all)
                }
            } catch {
                print("Failed to save currencies to Realm: \(error)")
            }
        }
    }
    func getCurrencies() -> Results<Currency>? {
        return realm.objects(Currency.self)
    }
    func saveBalance(_ balance: Balance) {
        print("savingBalance: \(balance.amount)")
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.add(balance, update: .all)
                }
            } catch {
                print("Failed to save balance to Realm: \(error)")
            }
        }
    }
    func getBalances() -> Results<Balance>? {
            let balance = realm.objects(Balance.self)
            return balance
    }
    func saveTransaction(_ transaction: Transaction) {
        DispatchQueue.main.async {
            do {
                try self.realm.write {
                    self.realm.add(transaction, update: .all)
                }
            } catch {
                print("Failed to save transaction to Realm: \(error)")
            }
        }
    }
    func getTransactions() -> Results<Transaction>? {
            let balance = realm.objects(Transaction.self)
            return balance
    }
}
