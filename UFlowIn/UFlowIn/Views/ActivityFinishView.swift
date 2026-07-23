//
//  ActivityFinishView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ActivityFinishView: View {

    @Environment(\.dismiss)
    private var dismiss

    @State private var showLocation =
        false

    var body: some View {

        VStack(spacing: 25) {

            Spacer()

            Image(
                systemName:
                    "checkmark.circle.fill"
            )
            .font(.system(size: 80))
            .foregroundStyle(.green)

            Text("Atividade concluída!")
                .font(.largeTitle.bold())

            Text(
                "Parabéns! Você concluiu sua atividade."
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)

            Spacer()

            PrimaryButton(
                title: "Continuar"
            ) {

                showLocation = true
            }
        }
        .padding(24)
        .alert(
            "Permitir localização?",
            isPresented:
                $showLocation
        ) {

            Button("Permitir") {

                dismiss()
            }

            Button(
                "Agora não",
                role: .cancel
            ) {

                dismiss()
            }

        } message: {

            Text(
                "A localização é utilizada para registrar sua atividade de corrida ou caminhada."
            )
        }
    }
}
#Preview{
    ActivityFinishView()
}
