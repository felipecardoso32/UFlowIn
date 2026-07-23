import SwiftUI

struct LoginView: View {

    @EnvironmentObject var appState: AppState

    @State private var email = ""
    @State private var password = ""

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 24
            ) {

                Text("Login")
                    .font(.largeTitle.bold())

                CustomTextField(
                    title: "E-mail",
                    text: $email,
                    keyboardType: .emailAddress
                )

                SecureField(
                    "Senha",
                    text: $password
                )
                .padding()
                .background(
                    Color.gray.opacity(0.08)
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                )

                PrimaryButton(
                    title: "Entrar"
                ) {

                    appState.login()
                }

                Divider()

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
        }
        .navigationTitle("Entrar")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    LoginView()
        .environmentObject(
            AppState()
        )
}
