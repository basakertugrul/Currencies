//
//  ContentView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()
    var body: some View {
        TabView(selection: $viewModel.screenTag) {
            NavigationView {
                MainView()
                    .environmentObject(viewModel.mainViewModel)
            }
            .tabItem {
                Images.mainScreen.image
                Text("Home")
            }
            .tag(0)
            NavigationView {
                PastOperationsView(viewModel: viewModel.pastOperationsViewModel)
            }
            .tabItem {
                Images.pastOperations.image
                Text("Past Operations")
            }
            .tag(1)
        }
        .tint(Colors.blue.color)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
