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
        if viewModel.transactions.isEmpty {
            VStack {
                Images.sadFace.image
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 54, height: 54)
                Text("You don't have any operations.")
                    .font(.body)
            }
            .foregroundColor(.gray)
            .padding()
            .navigationTitle("Past Operations")
        } else {
            Text("\(viewModel.transactions.count)")
                .font(.body)
                .foregroundColor(.black)
                .onAppear {
                    viewModel.getPastOperations()
                }
        }
    }
}
