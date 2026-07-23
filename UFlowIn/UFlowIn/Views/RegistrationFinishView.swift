//
//  RegistrationFinishView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct RegistrationFinishView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {

        VStack(spacing: 30) {

            Spacer()

            Image("Mascote")
                .resizable()
                .scaledToFit()
                .frame(height: 220)

            Text("Tudo pronto!")
                .font(.largeTitle.bold())

            Text(
                "Seu perfil está configurado. Agora é hora de começar sua jornada."
            )
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)

            Spacer()

            PrimaryButton(
                title: "Começar",
                style: .tertiary
            ) {

                appState.finishRegistration()
            }
        }
        .padding(24)
    }
}
#Preview {

    RegistrationFinishView()
        .environmentObject(
            AppState()
        )
}
