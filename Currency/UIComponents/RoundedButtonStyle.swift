//
//  RoundedButtonStyle.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct RoundedButtonStyle: ButtonStyle {
    var font: Font = .title
    var width: CGFloat = .infinity
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(font)
        }
        .frame(maxWidth: width)
        .padding(8)
        .foregroundColor(.white)
        .background(Colors.black.color)
        .cornerRadius(font == .title ? 12 : 8)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

