//
//  BuyingView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 13.06.2023.
//

import SwiftUI

struct BuyingView: View {
    @EnvironmentObject var viewModel: MainViewModel
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.addedCurrency != nil {
                Text(viewModel.addedCurrency!.getBuyText())
                    .foregroundColor(Colors.black.color)
                    .bold()
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .center)
                viewModel.addedCurrency!.getImage()
                    .resizable()
                    .frame(width: 60, height: 60)
                HStack(spacing: 4) {
                    Text("₺25")
                        .bold()
                        .font(.title)
                    Images.down.image
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .foregroundColor(Colors.red.color)
                VStack(spacing: 4) {
                    Text("\(viewModel.addedCurrency!.name) you want to buy")
                        .font(.title2)
                    HStack(spacing: 4) {
                        TextField("\(viewModel.addedCurrency!.name) amount...", text: $viewModel.currencyInput)
                            .keyboardType(.numberPad)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                            .padding()
                        Text(viewModel.addedCurrency!.symbol)
                            .font(.title2)
                    }
                    Text("Total cost")
                        .font(.title2)
                    HStack(spacing: 4) {
                        TextField("", text: $viewModel.totalCost)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                            .padding()
                        Text("₺")
                            .font(.title2)
                    }
                }
                Button("Buy") {
                    viewModel.addTransaction()
                }
                .buttonStyle(RoundedButtonStyle())
            }
        }
        .padding()
    }
}
