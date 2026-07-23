import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var email = ""
    @State private var password = ""
    
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
                    
                    Text("Bem-Vindo!")
                        .font(.largeTitle.bold())
                        .foregroundStyle(.colorsIndigo)
                        .multilineTextAlignment(.center)
                        .padding(.top, 23)
                    
                    Text("Faça login ou cadastre-se para continuar ")
                        .font(
                            Font.system(size: 17)
                                .weight(.medium)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.labelsVibrant2)
                        .padding(.top, -10)
                    
                    
                    
                    Rectangle()
                        .frame(width: 360, height: 500, alignment: .center)
                        .cornerRadius(16)
                        .foregroundStyle(.grayElement.opacity(0.7))
                        .shadow(color: .black.opacity(0.16), radius: 20, x: 0, y: 8)
                        .padding(.top, 40)
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
                                Text("Email")
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
                                title: "Insira sua senha",
                                text: $email,
                                keyboardType: .emailAddress
                            )
                            HStack(alignment: .center, spacing: 0) {
                             
                                Text("Esqueceu a senha?")
                                  .font(Font.system(size: 15))
                                  .underline(true, pattern: .solid)
                                  .foregroundColor(.colorsIndigo)
                            }
                            .padding(.horizontal, 30)
                            .padding(.vertical, 0)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
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
                                title: "Login"
                            ) {
                                
                                appState.registrationFinished = true
                                appState.onboardingFinished = true
                                appState.login()
                            }
                            /*
                            PrimaryButton(
                                title: "Criar conta"
                            ) {
                                
                                showRegister = true
                            }
                            */
                            
                            Text("Ou continue com:")
                                .font(
                                    Font.system(size: 17)
                                        .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(.labelsVibrant2)
                          //  Divider()
                            
                            SocialButton(
                                title: "Iniciar sessão com a Apple",
                                icon: "apple.logo"
                            ) {
                                
                                appState.login()
                            }
                            
                            SocialButton(
                                title: "Iniciar sessão com o Google",
                                icon: "logoGoogle",
                                isSystemIcon: false
                            ) {
                                
                                appState.login()
                            }
                           
                            
                            HStack(alignment: .center, spacing: 0) {
                             
                                Text("Ainda não tem uma conta?  ")
                                    .font(
                                        Font.system(size: 17)
                                            .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.labelsVibrant2)
                                Button {

                                    showRegister = true

                                } label: {

                                   
                                Text("Criar conta")
                                  .font(Font.system(size: 17))
                                  .underline(true, pattern: .solid)
                                  .foregroundColor(.colorsIndigo)
                                }
                                .buttonStyle(.plain)
                                .padding(.trailing, 20)
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        .padding(24)
                    
                    
                }.padding(.top, 140)
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
    }}

#Preview {

    LoginView()
        .environmentObject(
            AppState()
        )
}
