//
//  ContentViewModel.swift
//  Currency
//
//  Created by Başak Ertuğrul on 9.06.2023.
//

import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var mainViewModel: MainViewModel
    @Published var pastOperationsViewModel: PastOperationsViewModel
    private var cancellationBag: Set<AnyCancellable> = Set()
    @Published var screenTag: Int = 0
    init() {
        self.mainViewModel = MainViewModel()
        self.pastOperationsViewModel = PastOperationsViewModel()
        self.getCurrencies()
        self.addChangeScreenTagObserver()
    }
    func getCurrencies() {
        NetworkProvider.shared.getTopCurrencies { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let currencies):
                RealmProvider.shared.saveCurrencies(currencies)
                self.getCurrenciesforMainView()
            case .failure(let error):
                print("Failed to get currencies: \(error)")
            }
        }
    }
    func getCurrenciesforMainView() {
        DispatchQueue.main.async {
            withAnimation {
                self.mainViewModel.currencies = self.getCurrenciesFromRealm()
            }
        }
    }
    func getCurrenciesFromRealm() -> [Currency] {
        guard let realmCurrencies = RealmProvider.shared.getCurrencies() else { return [] }
        return Array(realmCurrencies)
    }
    func addChangeScreenTagObserver() {
        NotificationCenter
            .default
            .publisher(for: NSNotification.changeScreenTag)
            .sink { [weak self] _ in
                guard let self = self else {return}
                withAnimation {
                    self.screenTag = 1
                }
            }
            .store(in: &cancellationBag)
    }
}
