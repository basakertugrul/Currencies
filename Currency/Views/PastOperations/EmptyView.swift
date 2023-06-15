//
//  EmptyView.swift
//  Currency
//
//  Created by Başak Ertuğrul on 15.06.2023.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack(spacing: 8) {
            Images.sadFace.image
                .resizable()
                .renderingMode(.template)
                .frame(width: 54, height: 54)
            Text("You don't have any operations.")
                .font(.body)
        }
        .foregroundColor(.gray)
        .padding()
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
