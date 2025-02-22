//
//  PreferenceKey+Extension.swift
//  SwiftUIBentoGrid
//
//  Created by Kyle Lei on 2024/8/15.
//

import SwiftUI


struct GridSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}



extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: GridSizePreferenceKey.self, value: geometry.size)
            }
            .onPreferenceChange(GridSizePreferenceKey.self, perform: onChange)
        }
    }
}
