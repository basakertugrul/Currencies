//
//  CardViewModifier.swift
//  Currency
//
//  Created by Başak Ertuğrul on 12.06.2023.
//

import SwiftUI

struct CardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Colors.secondary.color)
            .cornerRadius(8)
            .shadow(color: Colors.black.color.opacity(0.2), radius: 4)
    }
}

extension View {
    func cardViewModifier() -> some View {
        modifier(CardBackground())
    }
}
