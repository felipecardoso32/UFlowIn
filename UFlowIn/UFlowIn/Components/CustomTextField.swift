//
//  CustomTextField.swift
//  UFlowIn
//

import SwiftUI

struct CustomTextField: View {

    // MARK: - Propriedades

    let title: String
    @Binding var text: String

    var keyboardType: UIKeyboardType = .default

    // Largura padrão
    var width: CGFloat = 300

    // Altura padrão
    var height: CGFloat = 44

    // Raio da borda
    var cornerRadius: CGFloat = 16

    // Cor da borda
    var strokeColor: Color = .labelsVibrant3

    // Espessura da borda
    var strokeWidth: CGFloat = 1


    // MARK: - Body

    var body: some View {

        TextField(
            title,
            text: $text
        )
        .keyboardType(
            keyboardType
        )
        .padding()
        .frame(
            width: width,
            height: height
        )
        .background(
            Color.labelsWhite
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: cornerRadius
            )
        )
        .overlay {

            RoundedRectangle(
                cornerRadius: cornerRadius
            )
            .stroke(
                strokeColor,
                lineWidth: strokeWidth
            )
        }
    }
}
