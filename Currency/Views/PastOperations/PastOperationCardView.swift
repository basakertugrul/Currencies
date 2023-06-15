//
//  PastOperationCardView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 15.06.2023.
//

import SwiftUI

struct PastOperationCardView: View {
    let transaction: Transaction
    var body: some View {
        HStack(spacing: 8) {
            transaction.currency?.getImage()
                .resizable()
                .frame(width: 44, height: 44)
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.getName())
                    .font(.body)
                    .bold()
                    .foregroundColor(Colors.black.color)
                Text(transaction.getInfo())
                    .font(.body)
                Text(transaction.getDate())
                    .font(.body)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.body)
            .foregroundColor(Colors.gray.color)
            Text(transaction.getAmountInfo())
                .font(.title3)
                .foregroundColor(Colors.green.color)
        }
        .frame(maxWidth: .infinity)
        .cardViewModifier()
    }
}
