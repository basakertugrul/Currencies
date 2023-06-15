//
//  PastOperationsView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct PastOperationsView: View {
    @StateObject var viewModel: PastOperationsViewModel
    var body: some View {
        ZStack {
            if viewModel.transactions.isEmpty {
                EmptyView()
            } else {
                List(viewModel.transactions, id: \.date) { transaction in
                    PastOperationCardView(transaction: transaction)
                        .padding(8)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Past Operations")
        .onAppear {
            viewModel.getPastOperations()
        }
    }
}
