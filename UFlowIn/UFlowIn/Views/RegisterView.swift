import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var appState: AppState

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {

        ScrollView {

            VStack(
                alignment: .leading,
                spacing: 20
            ) {

                Text("Crie sua conta")
                    .font(.largeTitle.bold())

                CustomTextField(
                    title: "Nome completo",
                    text: $name
                )

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

                SecureField(
                    "Confirmar senha",
                    text: $confirmPassword
                )
                .padding()
                .background(
                    Color.gray.opacity(0.08
                    )
                )
                .clipShape(
                    RoundedRectangle(
                        cornerRadius: 12
                    )
                )

                PrimaryButton(
                    title: "Avançar"
                ) {

                    appState.login()
                }
            }
            .padding(24)
        }
        .navigationTitle("Cadastro")
    }
}

#Preview {

    RegisterView()
        .environmentObject(
            AppState()
        )
}
