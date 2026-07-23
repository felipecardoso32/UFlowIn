import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var appState: AppState

    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var showLogin = false
    @State private var showRegister = false

    var body: some View {

        NavigationStack {
            
            ZStack(alignment: .center){
                
                
                Color(.grayBackground)
                    .ignoresSafeArea()
                
                // .padding(.horizontal, 32)
                //.padding(.vertical, 20)
                
                VStack(alignment: .center){
                    VStack{
                    Text("Crie sua conta")
                        . font(
                            Font.system(size: 28)
                                .weight(.bold)
                        )
                        .foregroundStyle(.colorsIndigo)
                        .multilineTextAlignment(.center)
                        .padding(.top, -30)
                    
                    Text("Comece sua jornada fitness em poucos passos ")
                        .font(
                            Font.system(size: 17)
                                .weight(.medium)
                        )
                        .frame(width: 264, alignment: .center)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.colorsIndigo)
                        .padding(.top, -2)
                    
                    }.padding(.top, 20)
                    
                    Rectangle()
                        .frame(width: 360, height: 625, alignment: .center)
                        .cornerRadius(16)
                        .foregroundStyle(.grayElement.opacity(0.7))
                        .shadow(color: .black.opacity(0.16), radius: 20, x: 0, y: 8)
                        .padding(.top, 15)
                }
                
                //.padding(.top, 100)
                
                
                ZStack(
                    alignment: .center
                ){
                    
                    
                    VStack(
                        alignment: .center,
                        spacing: 15
                    ) {
                        
                        
                        
                        
                        HStack(alignment: .center, spacing: 0) {
                            // Subheadline/Regular
                            Text("Nome completo")
                                .font(
                                    Font.system(size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.labelsBlack)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 20)
                                .padding(.top, 20)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, -10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        CustomTextField(
                            title: "Por exemplo: Flowy",
                            text: $email,
                            keyboardType: .emailAddress
                        )
                        
                        
                        HStack(alignment: .center, spacing: 0) {
                            // Subheadline/Regular
                            Text("Email")
                                .font(
                                    Font.system(size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.labelsBlack)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 20)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, -10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        CustomTextField(
                            title: "exemplo@email.com",
                            text: $email,
                            keyboardType: .emailAddress
                        )
                        HStack(alignment: .center, spacing: 0) {
                            // Subheadline/Regular
                            Text("Senha")
                                .font(
                                    Font.system(size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.labelsBlack)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 20)
                                .padding(.top, 20)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, -10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        CustomTextField(
                            title: "Mínimo 6 caracteres",
                            text: $email,
                            keyboardType: .emailAddress
                        )
                        
                        
                        HStack(alignment: .center, spacing: 0) {
                            // Subheadline/Regular
                            Text("Confirmar senha")
                                .font(
                                    Font.system(size: 15)
                                        .weight(.semibold)
                                )
                                .foregroundColor(.labelsBlack)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .padding(.leading, 20)
                                .padding(.top, 10)
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, -10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        CustomTextField(
                            title: "Digite sua senha novamente",
                            text: $email,
                            keyboardType: .emailAddress
                        )
                        
                        //sistema de senhas, nao implementado
                        /*SecureField(
                         "Senha",
                         text: $password
                         )
                         .padding()
                         .background(
                         .labelsWhite
                         )
                         .clipShape(
                         RoundedRectangle(
                         cornerRadius: 16
                         )
                         )*/
                        
                        PrimaryButton(
                            title: "Avançar"
                        ) {
                              appState.login()
                        }
                        /*
                         PrimaryButton(
                         title: "Criar conta"
                         ) {
                         
                         showRegister = true
                         }
                         */
                        
                        Text("Ou crie sua conta com:")
                            .font(
                                Font.system(size: 17)
                                    .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.labelsVibrant2)
                        //  Divider()
                        
                        SocialButton(
                            title: "Criar conta com a Apple",
                            icon: "apple.logo"
                        ) {
                            
                            appState.login()
                        }
                        
                        SocialButton(
                            title: "Criar conta com o Google",
                            icon: "logoGoogle",
                            isSystemIcon: false
                        ) {
                           
                            appState.login()
                        }
                        
                        
                        HStack(alignment: .center, spacing: 0) {
                            
                            Text("Já possui uma conta?  ")
                                .font(
                                    Font.system(size: 17)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.labelsVibrant2)
                            Button {
                                
                                //showRegister = true
                                appState.registrationFinished = true
                                appState.onboardingFinished = true
                                appState.login()
                                
                            } label: {
                                
                                
                                Text("Entrar")
                                    .font(Font.system(size: 17))
                                    .underline(true, pattern: .solid)
                                    .foregroundColor(.colorsIndigo)
                            }
                            .buttonStyle(.plain)
                            .padding(.trailing, 20)
                        }
                        .padding(.horizontal, 50)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(24)
                    
                    
                }.padding(.top, 100)
                    .navigationBarTitleDisplayMode(.inline)
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
}

#Preview {

    RegisterView()
        .environmentObject(
            AppState()
        )
}
