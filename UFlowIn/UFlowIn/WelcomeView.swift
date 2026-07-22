//
//  WelcomeView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct WelcomeView: View {

    @EnvironmentObject var appState: AppState

    @State private var showLogin = false
    @State private var showRegister = false

    var body: some View {

        NavigationStack {

            VStack(spacing: 20) {

                Spacer()

                Image("Mascote")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 220)

                Text("Bem-vindo!")
                    .font(.largeTitle.bold())

                Text(
                    "Faça login para continuar sua jornada."
                )
                .foregroundStyle(.secondary)

                Spacer()

                PrimaryButton(
                    title: "Login"
                ) {

                    showLogin = true
                }

                PrimaryButton(
                    title: "Criar conta"
                ) {

                    showRegister = true
                }

                SocialButton(
                    title: "Continuar com Apple",
                    icon: "apple.logo"
                ) {

                    appState.login()
                }

                SocialButton(
                    title: "Continuar com Google",
                    icon: "G",
                    isSystemIcon: false
                ) {

                    appState.login()
                }
            }
            .padding(24)
            .navigationDestination(
                isPresented: $showLogin
            ) {

                LoginView()
            }
            .navigationDestination(
                isPresented: $showRegister
            ) {

                RegisterView()
            }
        }
    }
}
#Preview {

    WelcomeView()
        .environmentObject(
            AppState()
        )
}
