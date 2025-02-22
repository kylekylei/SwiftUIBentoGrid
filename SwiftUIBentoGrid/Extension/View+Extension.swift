//
//  View+ViewModifier+Extension.swift
//  SwiftUIGrid
//
//  Created by Kyle Lei on 2024/6/26.
//

import SwiftUI

struct CardBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white, in: RoundedRectangle(cornerRadius: 20))

    }
}


extension View {
    func cardBackgroundModifier() -> some View {
        modifier(CardBackgroundModifier())
    }

}
