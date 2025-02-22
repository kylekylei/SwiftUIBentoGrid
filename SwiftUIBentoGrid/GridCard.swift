//
//  GridCard.swift
//  SwiftUIBentoGrid
//
//  Created by Kyle Lei on 2024/8/15.
//

import SwiftUI


func GridCard(_ alphabet: String) -> some View {
    Text(alphabet)
        .font(.title)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white, in: RoundedRectangle(cornerRadius: 20))
}
