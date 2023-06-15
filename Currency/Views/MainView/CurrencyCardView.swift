//
//  CurrencyCardView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 9.06.2023.
//

import SwiftUI

struct CurrencyCardView: View {
    let currency: Currency
    let tryHistory: TRYHistory?
    var pressedBuy: (Currency) -> Void
    var body: some View {
        HStack(spacing: 8) {
            currency.getImage()
                .resizable()
                .frame(width: 32, height: 32)
            VStack(alignment: .leading, spacing: 4) {
                Text(currency.name)
                if tryHistory != nil {
                    HStack(spacing: 4) {
                        Text(tryHistory!.getStringofValue())
                        tryHistory!.getImageofValue()
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .foregroundColor(tryHistory!.getColorofValue())
                    .foregroundColor(Colors.red.color)
                }
            }
            Spacer()
            Button("Buy") {
                pressedBuy(currency)
            }
            .buttonStyle(RoundedButtonStyle(font: .subheadline, width: 80))
        }
        .cardViewModifier()
    }
}
