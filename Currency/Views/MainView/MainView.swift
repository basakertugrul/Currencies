//
//  MainView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                Text("\(viewModel.balanceAmount.liraString)")
                    .font(.title)
                    .foregroundColor(Colors.black.color)
                FlagImages.turkey.image
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            .shadow(color: Colors.black.color, radius: 20)
            Text("Currencies")
                .font(.title2)
                .bold()
                .foregroundColor(Colors.black.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            List(viewModel.currencies, id: \.code) { currency in
                CurrencyCardView(currency: currency, tryHistory: viewModel.currencyValues[currency], pressedBuy: viewModel.openPurchaseScreen)
                    .padding(8)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.white.opacity(0), Colors.black.color.opacity(0.35)]), startPoint: .center, endPoint: .bottom)
                    .cornerRadius(8)
                    .allowsHitTesting(false)
            )
            Button("Add Money") {
                viewModel.addRandomBalance()
            }
            .buttonStyle(RoundedButtonStyleWithIcon(icon: Images.plus.image))
            Button("Past Operations") {
                viewModel.changeScreenTag()
            }
            .buttonStyle(RoundedButtonStyleWithIcon(icon: Images.pastOperations.image))
        }
        .padding()
        .navigationTitle("Hi, Başak Ertuğrul!")
        .sheet(isPresented: $viewModel.purchaseIsOpen) {
            BuyingView()
                .ignoresSafeArea()
        }
    }
}
