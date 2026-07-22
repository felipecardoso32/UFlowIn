//
//  CustomTextField.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct CustomTextField: View {

    let title: String

    @Binding var text: String

    var keyboardType: UIKeyboardType = .default

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)

            TextField(
                title,
                text: $text
            )
            .keyboardType(keyboardType)
            .padding()
            .background(
                Color.gray.opacity(0.08)
            )
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12
                )
            )
        }
    }
}
