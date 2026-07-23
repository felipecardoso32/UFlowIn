//
//  PermissionsView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct PermissionsView: View {

    var onContinue: () -> Void

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 80))
                .foregroundStyle(.red)

            Text("Conecte-se ao Apple Health")
                .font(.title.bold())
                .multilineTextAlignment(.center)

            Text(
                "Permita que o UFlowIn acompanhe seus dados de atividade e progresso."
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)

            Spacer()

            PrimaryButton(
                title: "Próximo",
                style: .tertiary
            ) {

                onContinue()
            }
        }
        .padding(24)
    }
}
#Preview{
    PermissionsView(
        onContinue: {
                   print("Continuar pressionado")
               }
    )
}
