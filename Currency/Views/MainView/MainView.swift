//
//  MainView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel: MainViewModel
    var body: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.currencies, id: \.code) { currency in
                Text(currency.symbolNative)
                    .foregroundColor(.black)
                    .font(.title)
            }
            Spacer()
            Button("Add Money") {
            }
            .buttonStyle(RoundedButtonStyleWithIcon(icon: Images.plus.image))
            Button("Past Operations") {
                viewModel.openPurchaseScreen()
            }
            .buttonStyle(RoundedButtonStyleWithIcon(icon: Images.pastOperations.image))
        }
        .padding()
        .navigationTitle("Hi, Başak Ertuğrul!")
        .sheet(isPresented: $viewModel.purchaseIsOpen) {
            Color.pink
                .ignoresSafeArea()
        }
    }
}
