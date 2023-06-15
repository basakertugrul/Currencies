//
//  RoundedButtonStyleWithIcon.swift
//  Currency
//
//  Created by Başak Ertuğrul on 8.06.2023.
//

import SwiftUI

struct RoundedButtonStyleWithIcon: ButtonStyle {
    let icon: Image
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .font(.body)
            Spacer()
            icon
                .font(.system(size: 24))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(Colors.black.color)
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}
