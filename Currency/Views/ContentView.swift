//
//  ContentView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    let realmProvider: RealmProvider = RealmProvider()
    let networkProvider: NetworkProvider = NetworkProvider()
    func fetchCurrencies() {
        networkProvider.fetchTopCurrencies { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let currencies):
                DispatchQueue.main.async {
                    self.currencies = currencies
                }
                self.realmProvider.saveCurrencies(currencies)
            case .failure(let error):
                print("Failed to fetch currencies: \(error)")
            }
        }
    }
    var body: some View {
        TabView {
            NavigationView {
                MainView(viewModel: MainViewModel(networkProvider: networkProvider, realmProvider: realmProvider))
            }
            .tabItem {
                Images.mainScreen.image
                Text("Home")
            }
            NavigationView {
                PastOperationsView(viewModel: PastOperationsViewModel(networkProvider: networkProvider, realmProvider: realmProvider))
            }
            .tabItem {
                Images.pastOperations.image
                Text("Recent Operations")
            }
        }
        .onAppear {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
