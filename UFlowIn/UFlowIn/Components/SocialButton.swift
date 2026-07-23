//
//  SocialButton.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct SocialButton: View {
    // botao de login com a apple/google com diversas modificações programáveis
    //  o padrão é 300 largura e 44 altura de acordo com o figma. está Infinity e 52
    let title: String
    let icon: String
    var isSystemIcon = true
    var action: () -> Void

    var body: some View {

        Button {

            action()

        } label: {

            HStack {
                    // condicional para exibir icone da apple e icone da google
                if isSystemIcon {

                    Image(systemName: icon)
                        .font(.title3)
                        .foregroundColor(.labelsVibrant4)

                } else {

                    Image(icon)
                       // .font(.title3)
                        //.foregroundColor(.labelsVibrant4)
                }

                Text(title)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .foregroundColor(.labelsVibrant4)
            }
            .foregroundStyle(.primary)
            .frame(width: 300)
            .frame(height: 44)
            .background(.labelsBlack)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 30
                )
            )
            .overlay {

                RoundedRectangle(
                    cornerRadius: 30
                )
                .stroke(
                    .labelsBlack,
                    lineWidth: 1
                )
            }
        }
    }
}
