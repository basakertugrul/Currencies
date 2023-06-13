//
//  RoundedButtonStyle.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    let image: String
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: image)
                .font(.system(size: 16))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
